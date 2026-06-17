package com.example.myapplication

import android.os.Bundle
import androidx.activity.ComponentActivity
import androidx.activity.compose.setContent
import androidx.activity.enableEdgeToEdge
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.items
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.tooling.preview.Preview
import androidx.compose.ui.unit.dp
import com.example.myapplication.ui.theme.MyApplicationTheme
import java.text.SimpleDateFormat
import java.util.Date
import java.util.Locale

class MainActivity : ComponentActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        enableEdgeToEdge()
        setContent {
            MyApplicationTheme {
                Scaffold(modifier = Modifier.fillMaxSize()) { innerPadding ->
                    var showCalendar by remember { mutableStateOf(false) }

                    if (showCalendar) {
                        CalendarApp(modifier = Modifier.padding(innerPadding))
                    } else {
                        WelcomeScreen(
                            modifier = Modifier.padding(innerPadding),
                            onStart = {
                                showCalendar = true
                            }
                        )
                    }
                }
            }
        }
    }
}

// A simple class to hold one event's info
data class Event(val time: String, val title: String)

// Converts millis (from the date picker) into a "yyyy-MM-dd" string
fun convertMillisToDate(millis: Long): String {
    val formatter = SimpleDateFormat("yyyy-MM-dd", Locale.getDefault())
    formatter.timeZone = java.util.TimeZone.getTimeZone("ET")
    return formatter.format(Date(millis))
}

@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun CalendarApp(modifier: Modifier = Modifier) {

    // Map of date string -> list of events on that date
    val allEvents = remember { mutableStateMapOf<String, List<Event>>() }

    // The date picker is always showing, so its state IS the selected date
    val datePickerState = rememberDatePickerState()


    // Convert the picker's millis into a "yyyy-MM-dd" string (defaults to today)
    val selectedDate = datePickerState.selectedDateMillis?.let {
        convertMillisToDate(it)
    } ?: convertMillisToDate(System.currentTimeMillis())

    // Controls whether the "add event" popup is shown
    var showAddEventDialog by remember { mutableStateOf(false) }

    Column(modifier = modifier.fillMaxSize().padding(16.dp)) {



        // The date picker is always visible
        DatePicker(state = datePickerState)


        Spacer(modifier = Modifier.height(8.dp))

        // Get the list of events for the selected date (or empty list if none)
        val eventsForThisDay = allEvents[selectedDate] ?: emptyList()


        Row(verticalAlignment = Alignment.CenterVertically) {
            Text(text = "Events on $selectedDate (${eventsForThisDay.size}):")
            Spacer(modifier = Modifier.width(8.dp))
            Button(onClick = { showAddEventDialog = true }) {
                Text("Add event")
            }
        }



        LazyColumn {
            items(eventsForThisDay) { event ->

                Card(
                    modifier = Modifier
                        .fillMaxWidth()
                        .padding(vertical = 4.dp)
                ) {

                    Row(
                        modifier = Modifier
                            .fillMaxWidth()
                            .padding(12.dp),
                        verticalAlignment = Alignment.CenterVertically
                    ) {

                        Column(
                            modifier = Modifier.weight(1f)
                        ) {
                            Text(text = event.title)
                            Text(text = "Time: ${event.time}")
                        }


                        TextButton(
                            onClick = {

                                val updatedList =
                                    eventsForThisDay.filter { it != event }

                                allEvents[selectedDate] = updatedList
                            }
                        ) {
                            Text(text = "X")
                        }
                    }
                }
            }
        }

    }

    // ---------- ADD EVENT POPUP ----------
    if (showAddEventDialog) {
        AddEventDialog(
            onDismiss = { showAddEventDialog = false },
            onAdd = { time, title ->
                val currentList = allEvents[selectedDate] ?: emptyList()

                val newList = (currentList + Event(time, title)).sortedBy { it.time }

                allEvents[selectedDate] = newList

                showAddEventDialog = false
            }
        )
    }
}

@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun AddEventDialog(
    onDismiss: () -> Unit,
    onAdd: (time: String, title: String) -> Unit
) {
    var title by remember { mutableStateOf("") }
    val timePickerState = rememberTimePickerState()


    AlertDialog(
        onDismissRequest = onDismiss,
        title = { Text("New Event") },
        text = {
            Column {
                OutlinedTextField(
                    value = title,
                    onValueChange = { title = it },
                    label = { Text("Event title") }
                )

                Spacer(modifier = Modifier.height(8.dp))

                // Time picker is always visible inside the dialog
                TimePicker(state = timePickerState)
            }
        },
        confirmButton = {
            TextButton(onClick = {
                if (title.isNotBlank()) {
                    val time = String.format("%02d:%02d", timePickerState.hour, timePickerState.minute)
                    onAdd(time, title)
                }
            }) {
                Text("Add")
            }
        },
        dismissButton = {
            TextButton(onClick = onDismiss) {
                Text("Cancel")
            }
        }
    )
}

@Composable
fun WelcomeScreen(
    modifier: Modifier = Modifier,
    onStart: () -> Unit
) {
    Column(
        modifier = modifier
            .fillMaxSize()
            .padding(24.dp),
        horizontalAlignment = Alignment.CenterHorizontally,
        verticalArrangement = Arrangement.Center
    ) {

        Text(
            text = "My Calendar App",
            style = MaterialTheme.typography.headlineMedium
        )

        Spacer(modifier = Modifier.height(24.dp))

        Button(
            onClick = onStart
        ) {
            Text(
                text = "Open Calendar")
        }
    }
}

@Preview(showBackground = true)
@Composable
fun CalendarAppPreview() {
    MyApplicationTheme {
        CalendarApp()
    }
}