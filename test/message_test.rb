require './test/test_helper'

class MessageTest < Minitest::Test

  def test_it_initializes_a_message
    message1 = Message.new("/test/input.txt")
    assert_equal "hello world", message1.input_string
  end

  def test_it_finds_the_total_offset
    rotation1 = Rotation.new("12345")
    rotation1.set_rotations
    offset1 = Offset.new("010119")
    offset1.set_offsets
    message1 = Message.new("/test/input.txt", rotation1, offset1)
    message1.total_shift(rotation1, offset1)

    assert_equal 16, message1.shift_a
    assert_equal 24, message1.shift_b
    assert_equal 40, message1.shift_c
    assert_equal 46, message1.shift_d
  end

end
