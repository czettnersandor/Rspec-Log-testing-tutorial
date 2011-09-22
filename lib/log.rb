class Log
  def initialize(filename)
    @file = File.open(filename, "a")
  end
  
  def log_write(text)
    @file.write(text+"\n")
  end
  
  def close
    @file.close
  end
end