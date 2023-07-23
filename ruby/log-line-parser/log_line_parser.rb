class LogLineParser
  def initialize(line)
    @line = line
  end

  # Extract from format: '[<LOG>]: <Message>'
  def match_a(line)
    regex = /
      \[ (?<log>\w+) \]:  # log-level
      \s (?<msg>.+)       # error-message
    /x
    regex.match(line)
  end

  # Extract from format: '<Message> (<log>)'
  def match_b(line)
    regex = /
      (?<msg>[\w\s]+)   # error-message
      \( (?<log>\w+) \) # log-level
    /x
    regex.match(line)
  end

  def message
    match_a(@line)[:msg].strip
  end

  def log_level
    match_a(@line)[:log].strip.downcase
  end

  def reformat
    a = match_a(@line)
    m = a || match_b(@line)
    log = m[:log].strip
    msg = m[:msg].strip
    if a
      "#{msg} (#{log.downcase})"
    else
      "[#{log.upcase}]: #{msg}"
    end
  end
end

# puts LogLineParser.new('[ERROR]: Stack overflow').log_level
# puts LogLineParser.new('Segmentation fault (error)').reformat
# puts LogLineParser.new("[ERROR]: \t Corrupt disk\t \t \r\n").reformat
