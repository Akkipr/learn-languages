puts "Enter a number: "
num1 = gets.chomp().to_f
puts "Enter another number: "
num2 = gets.chomp().to_f
puts ("Please enter only (*),(+),(/),(-).")
puts "Enter a operation: "
operation = gets.chomp()

if operation == "-"
  puts (num1 - num2) 
elsif operation == "+"
  puts (num1 + num2) 
elsif operation == "/"
  puts (num1/num2) 
elsif operation == "*"
  puts (num1*num2) 
else
  puts ("Please enter only (*),(+),(/),(-).")
end
