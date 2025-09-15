require_relative "modules.rb"    # this is relative to the food.rb file
include Greetings                # Any print statements here will be reflected in the terminal when this program is run

Greetings.sayHiFrench("Bob")



class Food
  attr_accessor :name, :price, :location
end

hamburger = Food.new()
hamburger.name = "Hamburger"
hamburger.price = 3.50
hamburger.location = "Denny's"

puts hamburger.price

# Initialize method - the above is so muchhhh work

class Food1
  attr_accessor :name, :price, :location
  def initialize(name, price, location)
    @name = name
    @price = price
    @location = location
    puts "Creating Food..."
  end

  def total
    if (@price > 3.0) 
      puts "Too expensive"
    else
      puts "Cheap!!"
    end
  end


end

hotdog = Food1.new("Hotdog", 2.50, "Chick-Fil-A")
puts hotdog.name
puts hotdog.total


class Chef
  def make_curry
    puts "I can make curry"
  end
  def make_burrito
    puts "I can make burrito"
  end
  def make_special
    puts "I can make a special soup for you"
  end
end

chef1 = Chef.new()
chef1.make_special

class Indian_Chef < Chef                                # Inheritance
  def make_special                                      # Method overriding
    puts "I can make a special butter chicken for you"
  end
end

chef2 = Indian_Chef.new()
chef2.make_special