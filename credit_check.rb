require 'pry'

class CreditCard
  attr_reader :number

  def initialize(num)
    @number = num
  end

  def sixteen?(number)
    number.length == 16
  end

  def double (numbers)
    new_array = []
    numbers.split(//).each_with_index do |num, index|
      if index.even?
        int = num.to_i
        int *= 2
        num = int.to_s
      end
      new_array << num
    end
    new_array
  end

  def split_doubles(doubles)
    doubles.collect do |num|
     num.length > 1 ? num.split(//) : num
    end.flatten
  end

  def add_numbers(singles)
    total = 0
    singles.each do |num|
      total += num.to_i
    end
    total
  end

  def divide?(total)
    total % 10 == 0
  end

  def validate(num, total)
    self.sixteen?(num) && self.divide?(total)
  end

end
