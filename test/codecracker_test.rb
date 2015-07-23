require './test/test_helper'


class CodeCrackerTest < Minitest::Test

  def test_it_initializes_a_cracker
    cracker = CodeCracker.new("test/input.txt")
    assert_equal "..end..", cracker.decrypted_string
  end

  def test_it_maps_the_shifts_to_the_letters

    cracker = CodeCracker.new("test/input.txt")
    assert_equal [['h',0], ['e',1], ['l',2], ['l',3], ['o',4]],
                  cracker.map_shift_letter[0..4]
  end

  def test_it_finds_the_last_seven_chars

    cracker = CodeCracker.new("test/input.txt")
    assert_equal [['o',4],[' ',0],['w',1],['o',2],['r',3],['l',4],['d',0]],
            cracker.last_seven_chars
  end

  def test_it_indexes_the_decrypted_string
    cracker = CodeCracker.new("test/input.txt")
    assert_equal ['.',63], cracker.index_of_decrypted[0]
    assert_equal ['e',30], cracker.index_of_decrypted[2]
  end

  def test_it_indexes_the_encrypted_string #CHECK THESE ARRAYS
    cracker = CodeCracker.new("test/input.txt")
    assert_equal ['o',40,4], cracker.index_of_encrypted_with_shift[0]
    assert_equal ['w',48,1], cracker.index_of_encrypted_with_shift[2]
  end

  def test_it_finds_the_shifts
    cracker = CodeCracker.new("test/input_3_encrypted.txt")
    assert_equal [15,0], cracker.find_shift[0]
  end

  def test_it_maps_the_number_to_the_shifts
    cracker = CodeCracker.new("test/input_3_encrypted.txt")
    cracker.map_shift_to_letter
    assert_equal 15, cracker.shift_a
    assert_equal 23, cracker.shift_b
    assert_equal 36, cracker.shift_c
    assert_equal 47, cracker.shift_d
  end

  def test_it_finds_the_rotation
    cracker = CodeCracker.new("test/input_3_encrypted.txt")
    cracker.map_shift_to_letter

    offset1 = Offset.new("101015")
    offset1.set_offsets

    rotation = Rotation.new
    rotation.find_rotations(cracker, offset1)

    assert_equal 12, rotation.a
    assert_equal 23, rotation.b
    assert_equal 34, rotation.c
    assert_equal 45, rotation.d
  end

end
