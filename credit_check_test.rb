gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require_relative 'credit_check'

class CreditCardTest < Minitest::Test
  def test_it_has_a_number
    visa = CreditCard.new("5541808923795240")
    assert_equal "5541808923795240", visa.number
  end

  def test_sixteen_digits
    visa = CreditCard.new("5541808923795240")
    assert visa.sixteen?(visa.number)
  end

  def test_fifteen_digits
    visa = CreditCard.new("554180892379524")
    refute visa.sixteen?(visa.number)
  end

  def test_double_second_digit
    visa = CreditCard.new("5573")
    assert_equal ['10', '5', '14', '3'], visa.double("5573")
    # make array and double our second numbers return array of doubles with double digits
  end

  def test_split_doubles
    visa = CreditCard.new("5573")
    doubles = visa.double(visa.number)
    assert_equal ['1', '0', '5', '1', '4', '3'], visa.split_doubles(doubles)
  end

  def test_add_numbers
    visa = CreditCard.new("5541808923795240")
    doubles = visa.double(visa.number)
    singles = visa.split_doubles(doubles)
    assert_equal 70, visa.add_numbers(singles)
  end

  def test_divide
    visa = CreditCard.new("5541808923795240")
    doubles = visa.double(visa.number)
    singles = visa.split_doubles(doubles)
    total = visa.add_numbers(singles)
    assert visa.divide?(total)
  end

  def test_validate
    visa = CreditCard.new("5541808923795240")
    doubles = visa.double(visa.number)
    singles = visa.split_doubles(doubles)
    total = visa.add_numbers(singles)
    assert visa.validate(visa.number, total)
  end

end
