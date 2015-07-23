require './test/test_helper'

class IntegrationTest < Minitest::Test

  def test_it_encrypts_the_message  #hello_world
    rotation1 = Rotation.new("12345")
    rotation1.set_rotations
    offset1 = Offset.new("101015")
    offset1.set_offsets
    message1 = Message.new("/test/input.txt", rotation1, offset1)
    message1.encrypt(rotation1, offset1)
    assert_equal 'w1HS8LFKY5s', message1.output
  end

  def test_it_encrypts_another_message #..end..
    rotation1 = Rotation.new("12345")
    rotation1.set_rotations
    offset1 = Offset.new("101015")
    offset1.set_offsets
    message1 = Message.new("/test/input_2.txt", rotation1, offset1)
    message1.encrypt(rotation1, offset1)
    assert_equal 'MUAUxMU', message1.output
  end

  def test_it_encrypts_a_third_message #..end..
    rotation1 = Rotation.new("23456")
    rotation1.set_rotations
    offset1 = Offset.new("111111")
    offset1.set_offsets
    message1 = Message.new("/test/crack_decrypt.txt", rotation1, offset1)
    message1.encrypt(rotation1, offset1)
    assert_equal 'oWsf1ACsaFY3gSAYmaWAGGW3Y6LL3Y', message1.output
  end

  def test_it_decrypts_the_message
    rotation1 = Rotation.new("12345")
    rotation1.set_rotations
    offset1 = Offset.new("101015")
    offset1.set_offsets
    message1 = Message.new("/test/input_3_encrypted.txt", rotation1, offset1)
    message1.decrypt(rotation1, offset1)
    assert_equal '..end..', message1.output
  end

  def test_it_decrypts_another_message
    rotation1 = Rotation.new("12345")
    rotation1.set_rotations
    offset1 = Offset.new("101015")
    offset1.set_offsets
    message1 = Message.new("/test/enc_hello_world.txt", rotation1, offset1)
    message1.decrypt(rotation1, offset1)
    assert_equal 'hello world', message1.output
  end

  def test_it_decrypts_a_third_message

    rotation1 = Rotation.new("23456")
    rotation1.set_rotations
    offset1 = Offset.new("111111")
    offset1.set_offsets
    message1 = Message.new("/test/crack_encrypt.txt", rotation1, offset1)
    message1.decrypt(rotation1, offset1)
    assert_equal 'My name is Ryan Asensio..end..', message1.output
  end


  def test_it_cracks_a_code_and_decrypts_the_message
    cracker = CodeCracker.new("/test/crack_encrypt.txt")
    cracker.map_shift_to_letter

    offset1 = Offset.new("111111")
    offset1.set_offsets

    rotation = Rotation.new
    rotation.find_rotations(cracker, offset1)

    message1 = Message.new("/test/crack_encrypt.txt", rotation, offset1)
    message1.decrypt(rotation, offset1)

    assert_equal 'My name is Ryan Asensio..end..', message1.output
  end

end
