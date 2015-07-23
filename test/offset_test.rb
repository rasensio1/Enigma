require './test/test_helper'

class OffsetTest < Minitest::Test

  def test_it_initializes_an_offset
    offset1 = Offset.new("010119")
    assert_equal "010119", offset1.date
  end

  def test_it_find_significant_numbers
    offset1 = Offset.new("220715")
    assert_equal "11225", offset1.significant_numbers
  end

  def test_it_sets_offests
    offset1 = Offset.new("010119")
    offset1.set_offsets
    assert_equal 9, offset1.a
    assert_equal 4, offset1.b
    assert_equal 1, offset1.c
    assert_equal 6, offset1.d
  end

end
