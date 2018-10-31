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
    assert visa.sixteen?(visa.number)
  end

  def test_fifteen_digits

    visa = CreditCard.new(123455656789345)
    refute visa.sixteen?(visa.number)
  end

  def test_double_second_digit

    visa = CreditCard.new(1273)
    assert_equal [2, 2, 14, 3], visa.double(visa.number)
    # make array and double our second numbers return array of doubles with double digits
  end

def test_add_only_single_digits

  visa = CreditCard.new(127347)
  dub_array = visa.double(visa.number)
  assert_equal 22, visa.no_dubs(dub_array)
end

def test_only_double_digts

  visa = CreditCard.new(1273)
  dub_array = visa.double(visa.number)
  assert_equal [14], visa.only_dubs(dub_array)
end

def test_add_doubles


visa = CreditCard.new(8273)
dub_array = visa.double(visa.number)
var = visa.only_dubs(dub_array)
assert_equal 12, visa.add_doubles(var)
end

def test_total_invalid
  visa = CreditCard.new(8273)
  dub_array = visa.double(visa.number)
  singles = visa.no_dubs(dub_array)
  var = visa.only_dubs(dub_array)
  doubles = visa.add_doubles(var)

  assert_equal false, visa.total(singles, doubles)
end

def test_total_valid
  visa = CreditCard.new(9107034291070342)
  dub_array = visa.double(visa.number)
  singles = visa.no_dubs(dub_array)
  var = visa.only_dubs(dub_array)
  doubles = visa.add_doubles(var)

  assert_equal true, visa.total(singles, doubles)
end

def test_validate

  visa = CreditCard.new(5541808923795240)
  dub_array = visa.double(visa.number)
  singles = visa.no_dubs(dub_array)
  var = visa.only_dubs(dub_array)
  doubles = visa.add_doubles(var)
  assert_equal true, visa.total(singles, doubles)
  assert visa.sixteen?(visa.number)
end


end
