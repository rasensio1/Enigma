require './test/test_helper'

class InputDateTest < Minitest::Test

  def test_it_initializes_a_date
    date1 = InputDate.new("01011991")
    assert_equal "01011991", date1.value
  end

end
