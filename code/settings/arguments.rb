# =============================================================================
# REQUIRES
# =============================================================================

require "optparse"

# =============================================================================
# FUNCTIONS
# =============================================================================

def program_name()
  name = $0
  if name
    if name.kind_of? String
      return name.gsub("./", "")
    else
      exit
    end
  else
    exit
  end
end

def help()
  string = """Command Line Helper to the Program - #{program_name()}

Usage Exemple: ruby example.rb [options]

Options:

-h    | --helper                HELPER.
-e    | --endpoint              GITLAB ENDPOINT.
-t    | --token                 GITLAB PRIVATE TOKEN.
-p    | --project               GITLAB PROJECT.
-c    | --channel               SLACK CHANNEL.
-w    | --webhook               SLACK WEBHOOK.\n
"""
  return puts(string)
end

def command_line_parser()
  options = {}
  OptionParser.new do |opts|
    opts.banner = "Usage: example.rb [options]"
    opts.on("-h", "--helper") { |value| help() }
    opts.on("-e", "--endpoint GITLAB ENDPOINT", "GitLab Endpoint") { |value| options["endpoint"] = value }
    opts.on("-t", "--token GITLAB PRIVATE TOKEN", "GitLab Private Token") { |value| options["token"] = value }
    opts.on("-p", "--project GITLAB PROJECT", "GitLab Project") { |value| options["project"] = value }
    opts.on("-c", "--channel SLACK CHANNEL", "Slack Channel") { |value| options["channel"] = value }
    opts.on("-w", "--webhook SLACK WEBHOOK", "Slack Webhook") { |value| options["webhook"] = value }
  end.parse!
  return options
end
