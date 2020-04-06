# =============================================================================
# CLASS - REQUIRES
# =============================================================================

require "yaml"

# =============================================================================
# CLASS - READER YML FILE
# =============================================================================

class ReaderYMLFile

  attr_reader :file

  def initialize(file)
    @file = file
    end

  def get_content
    begin
      return eval(YAML.load_file(@file).inspect)
    rescue ArgumentError => error
      puts "Could not parse YAML: #{error.message}"
    end
  end

end
