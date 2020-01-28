#!/usr/bin/ruby

# =============================================================================
# REQUIRES
# =============================================================================

require "gitlab"
require "json"
require "uri"
require "httparty"
require "optparse"

# =============================================================================
# FUNCTIONS
# =============================================================================

def gitlab_project(endpoint, private_token, project_name)
    Gitlab.configure do |config|
        config.endpoint = endpoint
        config.private_token = private_token
    end
    return Gitlab.project(project_name).to_h
end

# =============================================================================

def paylod(channel, webhook)
    return {
        "channel" => channel,
        "webhook" => webhook
    }.to_json
end

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

# =============================================================================

def help()

    string = """Command Line Helper to the Program - #{program_name()}

Usage Exemple: ruby example.rb [options]

Options:

-h    | --helper                HELPER.
-e    | --endpoint              GITLAB ENDPOINT.
-p    | --private-token         GITLAB PRIVATE TOKEN.\n
"""
    return puts(string)
end

# =============================================================================

def command_line_parser()
    options = {}
    OptionParser.new do |opts|
        opts.banner = "Usage: example.rb [options]"
        opts.on("-h", "--helper") { |v| help() }
        opts.on("-e", "--endpoint GITLAB ENDPOINT", 'Source name') { |v| options["endpoint"] = v }
        opts.on("-p", "--private-token GITLAB PRIVATE TOKEN", 'Source port') { |v| options["private-token"] = v }
    end.parse!
    return options
end

# =============================================================================
# MAIN
# =============================================================================

if __FILE__ == $0

    options = command_line_parser()

end
