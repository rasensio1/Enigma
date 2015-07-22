require './test/test_helper'

class KeyTest < Minitest::Test
  def test_it_initializes_a_key_with_default_value
    key1 = Key.new
    assert_equal "", key1.value
  end

  def test_key_can_take_number_param
    key1 = Key.new("12345")
    assert_equal "12345", key1.value
  end

  def test_it_creates_a_key_from_rotations

    cracker = CodeCracker.new("test/input_3_encrypted.txt", "101015")
    cracker.map_shift_to_letter

    offset1 = Offset.new("101015")
    offset1.set_offsets

    rotation = Rotation.new
    rotation.find_rotations(cracker, offset1)

    key = Key.new

    assert_equal '12345', key.create_key_from_rotation(rotation)

  end


end
