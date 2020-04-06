require "logger"

class Log

  attr_reader :logger

  def initialize
    @logger = self.class.default_logger
  end

  def self.default_logger
    logger = Logger.new(STDOUT)
    logger.formatter = proc { |severity, datetime, progname, msg| "#{severity}, #{datetime}, #{msg}\n" }
    return logger
  end

end
