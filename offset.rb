class Offset
  attr_reader :date
  attr_accessor :a, :b, :c, :d, :e

  def initialize(date)
    @date = date
  end

  def significant_numbers
    (@date.to_i ** 2).to_s.chars.last(5).join.to_s
  end

  def set_offsets
    significant_numbers
    @a = significant_numbers[0].to_i
    @b = significant_numbers[1].to_i
    @c = significant_numbers[2].to_i
    @d = significant_numbers[3].to_i
    @e = significant_numbers[4].to_i
  end

end
