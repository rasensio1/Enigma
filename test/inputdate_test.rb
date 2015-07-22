require './test/test_helper'

class InputDateTest < Minitest::Test

  def test_it_initializes_a_date
    date1 = InputDate.new("01011991")
    assert_equal "01011991", date1.value
  end

  def test_it_fomats_todays_date  #Curnet date changes....
    skip
    date1 = InputDate.new
    assert_equal "200715", date1.now
  end

end
