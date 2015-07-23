require './key'
require './offset'
require './rotation'
require './inputdate'
require './message'
require './codecracker'
require './outputfile'
require 'date'


if __FILE__==$0

  case ARGV[0].downcase

  when "encrypt"

    message = Message.new('input.txt')
    date = InputDate.new.now
    key = Key.new.generate
    offset = Offset.new(date)
    offset.set_offsets
    rotation = Rotation.new(key)
    rotation.set_rotations
    OutputFile.write("output.txt", message.encrypt(rotation, offset))

    puts "Created output.txt with the key #{key} and date #{date}"

  when "decrypt"

    message = Message.new("input.txt")
    date = ARGV[1]
    key = ARGV[2]
    offset = Offset.new(date)
    offset.set_offsets
    rotation = Rotation.new(key)
    rotation.set_rotations
    OutputFile.write("output.txt", message.decrypt(rotation, offset))

    puts "Created output.txt from input.txt with your given key: #{key} and date: #{date}"

  when "crack"
    cracker = CodeCracker.new("input.txt")
    cracker.map_shift_to_letter
    date = ARGV[1]
    offset1 = Offset.new(date)
    offset1.set_offsets

    rotation = Rotation.new
    rotation.find_rotations(cracker, offset1)

    message1 = Message.new("input.txt", rotation, offset1)
    OutputFile.write("output.txt", message1.decrypt(rotation, offset1))

    puts "Created output.txt from input.txt with your given date: #{date}"

  end
end
