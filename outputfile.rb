class OutputFile < File
  attr_reader :name, :message


  def initialize(name, message)
    @name = name
  end

  def new
    file = File.new("#{name}", 'w')
  end

  def write(name, message)
    binding.pry
    file = new.open("#{name}", 'w')
    file.write(message.gsub('&', '\n'))
  end

end
