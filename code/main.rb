require "logger"
require_relative "./tools/file.rb"
require_relative "./settings/configuration.rb"
require_relative "./settings/log.rb"

configuration = Configuration.new
yml_reader = ReadYMLFile.new("values.yml")
logger = Log.instance

values = yml_reader.get_content

logger.info("Default Logger")

puts "\nThe values #{values}"
puts "\nConfiguration variables #{configuration.variables}"
