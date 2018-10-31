require 'pry'

class CreditCard
  attr_reader :number

  def initialize(num)
    @number = num
  end

  def num_digits(var)
    Math.log10(var).to_i + 1
  end

  def sixteen?(number)
    num_digits(number) == 16
  end

  def double(numbers)
    array = numbers.to_s.scan(/./).map {|e| e.to_i }
    new_array = []
    array.each_with_index do |num, index|
      if index.even?
        num *= 2
      end
      new_array << num
    end
    new_array
  end

  def no_dubs(numbers)
    total = 0
    numbers.each_with_index do |num, index|
      if num < 10
        total += num
      end
    end
      total
  end

  def only_dubs(numbers)
    dubs_array =[]
    numbers.each_with_index do |num, index|
      if num > 9
        dubs_array << num
      end
    end
      dubs_array
  end

  def add_doubles(dubs)
    strings = dubs.collect do |num|
      num.to_s.split(//)
    end
    flat_strings = strings.flatten
    total = 0
    flat_strings.each do |string|
      total += string.to_i
    end
    total
  end

  def total(singles, doubles)
    (singles + doubles) % 10 == 0
  end

end
