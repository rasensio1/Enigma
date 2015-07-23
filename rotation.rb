class Rotation
  attr_accessor :key, :a, :b, :c, :d, :e

  def initialize(key = '')
    @key = key
  end

  def set_rotations
    @a = @key[0..1].to_i
    @b = @key[1..2].to_i
    @c = @key[2..3].to_i
    @d = @key[3..4].to_i
    @e = (@key[0] + @key[4]).to_i
  end

  def find_rotations(cracker, offset)
    @a = cracker.shift_a - offset.a
    @b = cracker.shift_b - offset.b
    @c = cracker.shift_c - offset.c
    @d = cracker.shift_d - offset.d
    @e = cracker.shift_e - offset.e
  end

end
