require 'date'
require 'pry'

class InputDate
  attr_reader :value

  def initialize(string = '')
    @value = string
  end

  def now
    string = ''
    string += DateTime.now.day.to_s.rjust(2, "0")
    string += DateTime.now.month.to_s.rjust(2, "0")
    string += DateTime.now.year.to_s[2..3]
  end


end
