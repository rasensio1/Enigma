require './encrypt'

class CodeCracker

  attr_reader  :date, :decrypted_string, :encrypted
  attr_accessor :shift_a, :shift_b, :shift_c, :shift_d

  def initialize(input_file, date)
    @encrypted = File.open("./#{input_file}").readlines[0].chomp.gsub(/\n/, '&')
    @decrypted_string = '..end..'
    @date = InputDate.new(date).value
  end

  def map_shift_letter
    shift_map = @encrypted.chars.each_with_index.map do |char, index|
      [char,index%4]
    end
    shift_map
  end

  def last_seven_chars
    length = @encrypted.length
    last_seven = map_shift_letter[length-7..length-1]
  end

  def characters_index(letter)
    Message::CHARACTERS_INDEX[letter]
  end

  def index_of_decrypted
    @decrypted_string.chars.map do |letter|
      [letter,characters_index(letter)]
    end
  end

  def index_of_encrypted_with_shift
    self.last_seven_chars.map do |let_index|
      [let_index[0],characters_index(let_index[0]),let_index[1]]
    end
  end

  def find_shift
    shifts = []
    encrypted = index_of_encrypted_with_shift
    decrypted = index_of_decrypted
    0.upto(6) do |i|
      shifts << [(encrypted[i][1] - decrypted[i][1])%66, encrypted[i][2]]
    end
    shifts
  end

  def map_shift_to_letter
    find_shift.each do |group|
      case group[1]
      when 0
        @shift_a = group[0]
      when 1
        @shift_b = group[0]
      when 2
        @shift_c = group[0]
      when 3
        @shift_d = group[0]
      end
    end
  end



end
