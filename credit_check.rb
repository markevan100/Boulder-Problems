require 'pry'

class CreditCard
  attr_reader :number

  def initialize(num)
    @number = num
    @num_string = num.to_s
  end

  def sixteen?
    self.number.to_s.length == 16
  end

  def double
    array = self.number.to_s.split(//)
    new_array = []
    array.each_with_index do |num, index|
      num = num.to_i
      if index.even?
        num *= 2
      end
      new_array << num
    end
    new_array
  end

  def no_dubs
    singles = self.double
    singles.each_with_index do |num, index|
      if num.to_s.length == 2
        singles.delete_at(index)
      end
    end
    total = 0
      singles.each do |string|
        total += string.to_i
      end
      total
  end

  def only_dubs
    doubles = self.double
    dubs_array =[]
    doubles.each_with_index do |num, index|
      if num.to_s.length == 2
        dubs_array << num
      end
    end
      dubs_array
  end

  def add_doubles
    dubs = self.only_dubs
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

  def add_totals(singles, doubles)
    singles + doubles
  end

  def divide
    total = add_totals(self.add_doubles, self.no_dubs)
    total % 10 == 0
  end

end
