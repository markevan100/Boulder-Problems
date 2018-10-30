require 'pry'

class CreditCard
  attr_reader :number

  def initialize(num)
    @number = num
    @num_string = num.to_s
  end

  def sixteen?
    self.number.length == 16
  end

  def double
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

  def validate
    self.sixteen? && self.divide?
  end

end
