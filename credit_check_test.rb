gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require_relative 'credit_check'

class CreditCardTest < Minitest::Test

  def setup
    @visa = CreditCard.new(1234556567890345)
  end

  def test_it_has_a_number
    visa = CreditCard.new(1234556)
    assert_equal 1234556, visa.number
  end

  def test_sixteen_digits_will_pass
    num = 1234556567890345
    assert @visa.sixteen?(num)
  end

  def test_fifteen_digits_will_fail
    num = 123455656789345
    refute @visa.sixteen?(num)
  end

  def test_double_every_other_digit_starting_with_first
    numbers = 1273
    assert_equal [2, 2, 14, 3], @visa.double(numbers)
  end

  def test_add_only_single_digits
    numbers = [2, 2, 14, 3]
    assert_equal 7, @visa.no_dubs(numbers)
  end

  def test_create_array_with_only_double_digts
    numbers = [2, 2, 14, 3]
    assert_equal [14], @visa.only_dubs(numbers)
  end

  def test_add_numbers_with_double_digits
  numbers = [14, 18, 12]
  assert_equal 17, @visa.add_doubles(numbers)
  end

  def test_total_invalid_if_remainder_when_divided_by_ten
    singles = 55
    doubles = 43
    refute @visa.total(singles, doubles)
  end

  def test_total_valid_if_no_remainder_when_divided_by_ten
    singles = 15
    doubles = 105
    assert @visa.total(singles, doubles)
  end

  def test_validate_by_number_of_digits_and_no_remainder
    singles = 15
    doubles = 105
    assert @visa.total(singles, doubles)
    assert @visa.sixteen?(@visa.number)
  end

  def test_valid_by_running_full_suite
    assert @visa.valid?
  end

  def test_invalid_by_running_full_suite_not_16
    visa = CreditCard.new(12345565678903450)
    refute visa.valid?
  end

  def test_invalid_by_running_full_suite_remainder
    visa = CreditCard.new(1134556567890345)
    refute visa.valid?
  end

end
