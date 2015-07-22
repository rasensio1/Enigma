require './key'
require './offset'
require './rotation'
require './inputdate'
require './message'
require './codecracker'
require './outputfile'
require 'date'

# if ARGV[0] = "encrypt"
#
# message = Message.new(ARGV[1])
# date = InputDate.new.now
# key = Key.new.generate
# offset = Offset.new(date)
# offset.set_offsets
# rotation = Rotation.new(key)
# rotation.set_rotations
# OutputFile.write(ARGV[2], message.encrypt(rotation, offset))
#
# puts "Created #{ARGV[2]} with the key #{key} and date #{date}"
# end
#
# if ARGV[0] = "decrypt"
#
#   message = Message.new(ARGV[1])
#   date = ARGV[3]
#   key = ARGV[4]
#   offset = Offset.new(date)
#   offset.set_offsets
#   rotation = Rotation.new(key)
#   rotation.set_rotations
#   OutputFile.write(ARGV[2], message.decrypt(rotation, offset))
#
#   puts "Created #{ARGV[2]} with the key #{key} and date #{date}"
# end
