class Question
  attr_accessor :prompt, :answer

  def initialize(prompt, answer)
    @prompt = prompt
    @answer = answer
  end
end

q1 = "How old is Akshayan?\n(a)17\n(b)19\n(c)20\n(d)18\n"
q2 = "How tall is Akshayan?\n(a)170cm\n(b)172cm\n(c)174cm\n(d)210cm\n"
q3 = "Where was Akshayan born?\n(a)Sri Lanka\n(b)UK\n(c)Canada\n(d)India\n"

questions = [Question.new(q1, "d"),Question.new(q2, "b"), Question.new(q3, "c")]
score = 0
for question in questions
  puts question.prompt()
  answer = gets.chomp()
  if (answer == question.answer)
    score+=1
  end
end

puts ("You scored " + score.to_s + "/" + questions.length.to_s)