require './test/test_helper'

class RotationTest < Minitest::Test
  def test_it_initializes_a_rotation
    rotation1 = Rotation.new("01011")
    assert_equal "01011", rotation1.key
  end

  def test_it_sets_roatations   #what if rotation > 66??
    rotation1 = Rotation.new("12345")
    rotation1.set_rotations
    assert_equal 12, rotation1.a
    assert_equal 23, rotation1.b
    assert_equal 34, rotation1.c
    assert_equal 45, rotation1.d
  end

end
