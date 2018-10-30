require 'pry'

class CreditCard
  attr_reader :number, :valid

  def initialize(num)
    @number = num
    @num_string = num.to_s
  end
  
  def validate_number
    # this can be thought of as a "runner method", that when called, does the
    # "processing" of the card through all the funtions. 
    @valid = validate
  end

  def sixteen?(number)
    number.length == 16
    # an example of making the methods take arguments - I changed this method, 
    # and ran the tests, and every test fails, because every test depends on
    # the output of this method. 
    #
    # this is a sign of your methods being _highly coupled_, and figuring out
    # how to decouple methods is a big step towards figuring out how to take a
    # complex operation and boil it down to many small, easy operations. 
  end

  def double
    # double shouldn't really care about anything but the input. What does it
    # double? It doubles every other number in the array passed to it. 
    array = self.number.split(//)
    new_array = []
    array.each_with_index do |num, index|
      if index.even?
        int = num.to_i
        int *= 2
        num = int.to_s
      end
      new_array << num
    end
    new_array
  end

  def split_doubles
    self.double.collect do |num|
     num.length > 1 ? num.split(//) : num
    end.flatten
  end

  def add_numbers
    total = 0
    self.split_doubles.each do |string|
      total += string.to_i
    end
    total
  end

  def divide?
    self.add_numbers % 10 == 0
  end

  def validate()
    self.sixteen? && self.divide?
  end

end
