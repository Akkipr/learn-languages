// Welcome to some GO NOTES!
// The goal by the end of this is to learn how to make a server for a future project.
// For that, we must first learn GOLANG.

// Boot.dev was used for these notes (and freeCodeCamp.org)

// main.go goes through the command line pipe to get compiled, which produces the exec file
// directly on the operating systems (without even installing Golang)!

// Compiling is done upfront. Languages like Python are interpreted on demand.

// Go is a bit slower mostly due to its automated memory management (slower than Rust, C)
// But it is faster than interpreted languages like Python and Java

package main

/*

import ("fmt") // import this to report to stdout

func main() {
	fmt.Println("hello world")
}
*/

// VARIABLES
/*
import "fmt"

func main() {
	var smsSendingLimit int
	var costPerSMS float64
	var hasPermission bool
	var username string
	fmt.Printf("%v %.2f %v %q\n", smsSendingLimit, costPerSMS, hasPermission, username)
}
*/

//Short form:
//Instead of var smsSendingLimit int, you can do mySkillIssues := 42 where Go will infer the type

/*
func main() {
	message := "Hello"
	age := 21

	fmt.Println(message, age) // Notice no type error here, whereas fmt.println("Hello", age) is a str+int error

	averageOpenRate, displayMessage := .23, "is the average open rate of your messages"			// same line declaration


}
*/

// FORMAT SPECIFIERS (as seen in C)
// %v = default where it's usually string , %T = type(a), %d = int but in decimal, %s = string, %t = bool (but %v works?), %.5f = float,

// TYPE CONVERSION
// floatValue := 88.26
// newValue := int(floatValue) 			// int64(floatValue) also works to change for performance types

// CONST
// just like Javascript, this means final and does not go away
// Issue with constants: no short form with :=
// const newMessage = "hello"

// msg := fmt.Sprintf("Hi %s, You are %d years old.", name, age)

// CONDITIONALS
/*
func main() {
	if height > 6 {
		// Do something
	}else if height > 3 {
		// do some more thing
	}else {
		// do some more
	}


	if height := 10; height > 6 {
		// Cool way (as seen in Python)
		// Saves a line and makes sure no other code can get height below this
	}
}

*/

// FUNCTIONS
/*
func sub(x1 int , x2 int) int {
	return x1-x2
}
// Just like your average function. Parameter with type, and return type (int)

// you can also for func sub(x1, x2 int) if the param before has the same type

// you can also have func sub(x1 int) (string string), here there are two return values
*/

// Unlike in C, setting one variable to another makes a copy, not the same in memory
// So passing in x to a function also passes in a copy. Make sure to equate it to x.

//RETURN VALUES
// You can name return values for functions, but only use it for small functions
// func sub(x1, x2 int) (x, y int)
// return

// You can also do:
// func sub(x1, x2 int) (int, int)
// return x, y

//STRUCTS - key value pairs

/*
type struct Car {
	Make string
	Model string
	Year int
}
myCar := Car{} // Empty values
c := Car {
	Make: "Honda",
	Model: "Prelude",
	Year: 1992,
}
fmt.Println("You car is %v %s %s", c.Year, c.Make, c.Model)

// You can do anonymous structs, but that's only if you want to use it once
*/

/*
// myCar := struct {
	Make string
} {
	Make: "Honda"
}

doing

type struct Car {
	Make string
	Model string
	Year int

}




// You can also do:
func (c car) age() int {
	return 2025 - c.age
}

c := Car {
	Make: "Honda"
	Model: "Prelude"
	Year: 1992
}
fmt.Println(c.age())






// Interfaces are implemented implicitly. Unlike in Java where you have to put the "implements" keyword

type Car interface {
	speed int
}

type ElectricCar struct {
	Make string
	Model string
	Year int
}
func (e ElectricCar) speed() int {
	return e.Year*2

}

em, ok := e.(email)
	This is a way to check for types. Here, e is the interface

	so if e, which is an interface, is instaniated to email, then ok becomes true and em is set to that full email struct.


*/

// SWITCH CASES

/*
func main2(num interface{}) {
	switch v := num.(type) {
	case int:
		fmt.Printf("%T", v)
		v.whateverintheinterface

	}

}



Try and catch but in Golang works the same way.
user, err := getUser()
if err != nill {
	fmt.Println(err)
}

You can also do like func something(User, error) where you can return error within the function

the error interface is simply a string


Make your own error message with error type
var err error = errors.New("This is now good")
		This saves us from making separate structs for each specific error.
*/

/*
FOR LOOPS
for i:=0; i<10; i++ {
	fmt.Println(i)
}

Omitting i<10 (for i:=10; ; i++) will make this run forever


WHILE LOOPS
for CONDITION {
}


ARRAYS
var myInts [10]int // declare array
primtes := [6]int{1,2,3,4,5,6}


SLICES
Allocate a specific amount of memory through the make() keyword


*/
