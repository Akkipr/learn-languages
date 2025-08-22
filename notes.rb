#print "Hello World"
#puts "Akshayan" # puts enters a newline at the end.


puts "VARIABLES"
puts "======================================================================================="
character_name = "John"
age = "33"
isMale = true
#flaws = nil             # does not have a value
puts (character_name + age)
# Modifying variables is just like any other program

# How to print out quotation marks
puts "hello\" world"

# Some cool string methods
phase = "Akshayan"
puts phase.upcase()
puts phase.downcase()
puts phase.strip()
puts phase.length()                 # yippeee unlike in C where you gotta do some math
puts phase.include? "sha"           # similar to "If sha in Akshayan, return true."
puts "=======================================================================================\n\n"

puts "INDEXING/SLICING"
puts "======================================================================================="
puts phase[1]
puts phase[0,3]                     # Returns Aks
puts phase.index("A")              # Returns 1 since thats when A starts

puts 5 + 9      # acc does the math!
puts 2**3       # 2^3
puts 10 % 3     # 1 (modulus)


# How to print num and string together?
num = 18
puts ("Akshayan is " + num.to_s + " years old.") # you can also do puts "Akshayan is #{num.to_s} years old."
puts num.abs()
puts num.round()
puts num.ceil()         # rounds up no matter what
puts num.floor()        # rounds down no matter what
puts "=======================================================================================\n\n"


puts "MATH CLASS"
puts "======================================================================================="
puts Math.sqrt(36)
puts Math.log(1)
puts "=======================================================================================\n\n"

# Integer / Integer returns an Integer
# Once you introduce a Float, the number returned is also the specific Float (Like python)

puts "USER INPUT"
puts "======================================================================================="
puts "Enter name: "
#name = gets.chomp() # this will get rid of the newline character the user enters (and buffers into puts)
#puts ("Hello " + name)
puts "=======================================================================================\n\n"

puts "ARRAYS"
puts "======================================================================================="
friends = Array["Bob", "Akshayan", "Praba"]
puts friends                 # this prints them with a newline
puts friends[0]              # can also do [-1]
friends[0] = "Darren"        # Modify value

friends_empty = Array.new
puts friends_empty[0]         # nil
friends_empty[0] = "Akshayan"
friends_empty[3] = "Brother"

puts friends_empty            # Indexes 1,2 are empty and print newlines
puts "=======================================================================================\n\n"


puts "ARRAY METHODS"
puts "======================================================================================="
puts friends.length()
puts friends.include? "Beta"
puts friends.reverse()
puts friends.sort()           # only use the same data type
puts "=======================================================================================\n\n"


puts "HASHES" # multiple pieces of information, but we can use key-value pairs (dictionary in Python)
puts "======================================================================================="
states = {
  "Canada" => "CAN",
  :UnitedStatesOfAmerica => "USA",
  3 => "UK"
}
puts states["Canada"]                       # prints CAN
puts states[:UnitedStatesOfAmerica]         # prints USA
puts "=======================================================================================\n\n"


puts "METHODS/FUNCTIONS"
puts "======================================================================================="
def input(action="swimming") # parameter with a default action
  puts ("You are " + action)
  5
end
input("free")         # Call the method
puts input("free")    # this prints 5 since it's the last known line in the function. Weird!
puts "=======================================================================================\n\n"

puts "RETURN KEYWORD"
puts "======================================================================================="
def input2(action="swimming") # parameter with a default action
  return puts ("You are " + action), "YEA"
end
name = input2("boating")
print name                  # prints both "You are boating" and "YEA", separated by line
puts "=======================================================================================\n\n"


puts "IF STATEMENTS"
puts "======================================================================================="
isRich = false

if isMale and isRich
  puts "You are a rich male."
elsif isMale and !isRich
  puts "You are a male but not rich."
else
  puts "You are either not male or not rich."
end
puts "=======================================================================================\n\n"
# You can use >= and <= like normal Python/C/Java


puts "SWITCH CASES"
puts "======================================================================================="
def month(abbrev)
  month_name = ""

  case abbrev
  when "Jan"
    month_name = "January"
  when "Feb"
    month_name = "February"
  else
    month_name = "Invalid month abbrev"
  end
  return month_name
end
puts month("Mar")
puts "=======================================================================================\n\n"



puts "WHILE LOOP"
puts "======================================================================================="
i = 1
while i < 10
  puts i
  i = i+1   # can also use +=
end
puts "=======================================================================================\n\n"



puts "FOR LOOPS"
puts "======================================================================================="
values = [1,2,3,4,5,6]
for value in values
  print value.to_s
end
puts

# another way:
values.each do |value|
  print value
end
puts

# range of numbers:
for index in 0..5
  print index.to_s
end
puts

# using a counter FOR LOOP:
pow_num = 3
pow_num.times do |index1|
  print (index1.to_s + "e")
end
puts "\n=======================================================================================\n\n"


puts "READING FILES"
puts "======================================================================================="
File.open("movies.txt", "r") do |file|
  # variable called file which we can use soon.
  
  puts file         # address
  #puts file.read()
  puts file.readline()    #line by line
  puts file.readline()
  puts file.readchar()    #char by char

  for line in file.readlines()
    puts line         # you can also do file.readlines()[2] since this is a list
  end

  
end

#ANOTHER WAY TO OPEN A FILE
file = File.open("movies.txt", "r") 
file.close()                             # With this method you gotta use close(file)
puts "=======================================================================================\n\n"


puts "WRITING/APPEND FILES"
puts "======================================================================================="
#File.open("movies.txt", "a") do |file|
  #file.write("Terminator 2")
#end

#File.open("movies.txt", "r+") do |file|
  #file.readline()                     # move the cursor to the next line
  #file.write("Term")                  # goes to line 2 and basically replaces the first few characters to fit Term
#end
puts "=======================================================================================\n\n"


puts "BEING-RESCUE" # TRY AND CATCH (but in Ruby)
puts "======================================================================================="
begin
  num = 1/0
rescue ZeroDivisionError
  puts "Division by zero error has been handled"
rescue TypeError => e
  puts ("Wrong Error!" + e.to_s)        # this prints the error
end
puts "=======================================================================================\n\n"
