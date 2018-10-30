gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require_relative 'credit_check'

class CreditCardTest < Minitest::Test
  def test_it_has_a_number
    visa = CreditCard.new('1234556')
    assert_equal '1234556', visa.number
  end

  def test_sixteen_digits
    visa = CreditCard.new('1234556567890345')
    assert visa.sixteen?(visa.number)
    # i converted the #sixteen? method to take an argument. Can you make the
    # rest of these methods follow the same principle? 
  end

  def test_fifteen_digits
    visa = CreditCard.new('123455656789345')
    refute visa.sixteen?(visa.number)
    # this method also tests #sixteen?, so I updated it.
  end

  def test_double_second_digit
    visa = CreditCard.new('1273')
    assert_equal ['2', '2', '14', '3'], visa.double
    # can you re-write this to be `visa.double('1273')` or `visa.double(1273)`
    # make array and double our second numbers return array of doubles with double digits
  end

  def test_split_doubles
    visa = CreditCard.new('8273')
    assert_equal ['1', '6', '2', '1', '4', '3'], visa.split_doubles
    # without any hints this time, can you make this method not depend on the
    # input given to `CreditCard.new()``? 
  end

  def test_add_numbers
    visa = CreditCard.new('8273')
    assert_equal 17, visa.add_numbers
  end

  def test_divide
    visa = CreditCard.new("5541808923795240")
    assert visa.divide?
  end

  def test_validate
    visa = CreditCard.new("5541808923795240")
    assert visa.validate
  end
end
