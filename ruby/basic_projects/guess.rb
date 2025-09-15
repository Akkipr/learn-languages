guess = ""
programming_languages = {
  1 => "Ruby",
  2 => "Python",
  3 => "Java",
  4 => "Go",
  5 => "C",
  6 => "Kotlin",
  7 => "Rust",
  8 => "R"
}
length = programming_languages.length()
num = Random.new.rand(0..length)
word = programming_languages[num]
guess_count = 0

puts "================================================================"
puts "Guess the programming language within 5 tries!!"
puts "================================================================"

while guess != word
  puts "Enter a guess: "
  guess = gets.chomp()
  guess_count = guess_count+1
  if guess_count >= 5
    puts "Oh no! "
    puts "You have used all 5 guesses! Sorry.."
    puts ("The programming language was " + word)
    return
  end
end

puts "WINNER!!! "
puts ("You got the correct guess in " + guess_count.to_s + " tries!")
