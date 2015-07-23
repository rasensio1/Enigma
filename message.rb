require 'pry'

class Message
  attr_reader :input_string
  attr_accessor :shift_a, :shift_b, :shift_c, :shift_d, :shift_e, :output

  INDEX_CHARACTERS = %w(A B C D E F G H I J K L M N O P Q R S T U V W X Y Z a b c d e f g h i j k l m n o p q r s t u v w x y z 0 1 2 3 4 5 6 7 8 9)+[' ']+['.']+[',']+['&']
  CHARACTERS_INDEX = {}

  INDEX_CHARACTERS.each_with_index do |char, index|
    CHARACTERS_INDEX[char] = index
  end


  def initialize(input_file, rotation = '', offset = '')
    @input_string = File.open("./#{input_file}").readlines[0].chomp.gsub(/\n/, '&')
  end

  def total_shift(rotation, offset, decrypt = 1)
    @shift_a = (rotation.a + offset.a) * decrypt
    @shift_b = (rotation.b + offset.b) * decrypt
    @shift_c = (rotation.c + offset.c) * decrypt
    @shift_d = (rotation.d + offset.d) * decrypt
    @shift_e = (rotation.e + offset.e) * decrypt
  end

  def encrypt(rotation, offset, dec = 1)
    total_shift(rotation, offset, dec)
    @output = @input_string.chars.each_with_index.map do |letter, index|
      a = lambda {INDEX_CHARACTERS[(CHARACTERS_INDEX[letter] + @shift_a)%66]}
      b = lambda {INDEX_CHARACTERS[(CHARACTERS_INDEX[letter] + @shift_b)%66]}
      c = lambda {INDEX_CHARACTERS[(CHARACTERS_INDEX[letter] + @shift_c)%66]}
      d = lambda {INDEX_CHARACTERS[(CHARACTERS_INDEX[letter] + @shift_d)%66]}
      e = lambda {INDEX_CHARACTERS[(CHARACTERS_INDEX[letter] + @shift_e)%66]}
      shift_case = {0 => a.call, 1=> b.call, 2=> c.call, 3=> d.call, 4=> e.call}
      shift_case[index % 5]
    end.join
  end

  def decrypt(rotation, offset)
    encrypt(rotation, offset, -1)
  end

end
