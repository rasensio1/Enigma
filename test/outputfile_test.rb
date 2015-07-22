require './test/test_helper'


class OutputFileTest < Minitest::Test

  def test_initializes_an_output_file
    output1 = OutputFile.new("encrypted.txt", "hello")
    assert_equal "encrypted.txt", output1.name
  end
end
