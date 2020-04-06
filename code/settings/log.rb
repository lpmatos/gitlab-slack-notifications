# =============================================================================
# REQUIRES
# =============================================================================

require "logger"
require "singleton"

# =============================================================================
# CLASS - MULTI IO
# =============================================================================

class MultiIO

  def initialize(*targets)
    @targets = targets
  end

  def write(*args)
    @targets.each {|target| target.write(*args)}
  end

  def close
    @targets.each(&:close)
  end

end

# =============================================================================
# CLASS - LOG
# =============================================================================

class Log

  include Singleton

  def initialize(file="/var/log/file.log")
    @logger = Logger.new MultiIO.new(STDOUT, File.open(file, "a"))
    @logger.level = Logger::INFO
    @logger.formatter = proc do |severity, datetime, progname, msg|
      "#{severity}, [#{datetime.strftime('%Y-%m-%d %H:%M:%S')}], #{msg}"
    end
  end

  def set_level(level)
    @logger.level = level
  end

  def info(message)
    @logger.info(message)
  end

  def debug(message)
    @logger.debug(message)
  end

  def error(message)
    @logger.error(message)
  end

  def warn(message)
    @logger.warn(message)
  end

end
