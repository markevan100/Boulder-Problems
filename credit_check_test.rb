gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require_relative 'credit_check'

class CreditCardTest < Minitest::Test
  def test_it_has_a_number
    visa = CreditCard.new(1234556)
    assert_equal 1234556, visa.number
  end

  def test_sixteen_digits
    visa = CreditCard.new(1234556567890345)
    assert visa.sixteen?
  end

  def test_fifteen_digits
    visa = CreditCard.new(123455656789345)
    refute visa.sixteen?
  end

  def test_double_second_digit
    visa = CreditCard.new(1273)
    assert_equal [2, 2, 14, 3], visa.double
    # make array and double our second numbers return array of doubles with double digits
  end

def test_add_only_single_digits
  visa = CreditCard.new(1273)
  assert_equal 7, visa.no_dubs
end

def test_only_double_digts
  visa = CreditCard.new(1273)
  assert_equal [14], visa.only_dubs
end

def test_add_doubles
visa = CreditCard.new(8273)
assert_equal 12, visa.add_doubles
end

def test_add_totals
  visa = CreditCard.new(8273)
  assert_equal 17, visa.add_totals(visa.add_doubles, visa.no_dubs)
end

end
