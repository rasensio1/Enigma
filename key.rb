class Key
  attr_accessor :value

  def initialize(number = '')
    @value = number
  end

  def generate
    keys = (10000..99999).to_a
    @value = keys.sample.to_s
  end

  def create_key_from_rotation(rotation)
    a = rotation.a.to_s
    b = rotation.b.to_s
    c = rotation.c.to_s
    d = rotation.d.to_s
    e = rotation.e.to_s
    a+c+d[1]
  end

end
