require "yaml"

class ReadYMLFile

  attr_reader :file

  def initialize(file)
    @file = file
    end

  def get_content
    return YAML.load_file(@file).inspect
  end

end
