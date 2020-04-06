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
  Gitlab.configure do |configuration|
    configuration.endpoint = endpoint
    configuration.private_token = private_token
  end
  return Gitlab.project(project_name).to_h
end

def payload(channel, webhook)
  return {
    "channel" => channel,
    "webhook" => webhook,
    "job_events" => true,
    "notify_only_broken_pipelines" => true,
    "pipeline_channel" => channel,
    "pipeline_events" => true
  }.to_json
end

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
    opts.on("-t", "--token GITLAB PRIVATE TOKEN", "GitLab Private Token") { |value| options["private-token"] = value }
    opts.on("-p", "--project GITLAB PROJECT", "GitLab Project") { |value| options["project"] = value }
    opts.on("-c", "--channel SLACK CHANNEL", "Slack Channel") { |value| options["channel"] = value }
    opts.on("-w", "--webhook SLACK WEBHOOK", "Slack Webhook") { |value| options["webhook"] = value }
  end.parse!
  return options
end

def ternario(value, other)
  return value ? value : ENV[other]
end

def gitlab_integration_slack(url, information)
  begin
    if url.kind_of? String
      request = HTTParty.put(url, :body => information, :headers => { "Content-Type" => "application/json" })
      if request.success?
        puts "\nSuccess - Integration Created..."
      end
    end
  rescue => error
      puts "\nError in Create integration to Slack - #{error}"
  end
end

def check_channel(options)
    return ternario(options["channel"], "SLACK_CHANNEL").include?("#") ? ternario(options["channel"], "SLACK_CHANNEL") : "#" << ternario(options["channel"], "SLACK_CHANNEL")
end

# =============================================================================
# MAIN
# =============================================================================

if __FILE__ == $0

  options = command_line_parser()

  endpoint = ""
  token = ""
  project = ""
  channel = ""
  webhook = ""

  project_information = gitlab_project(endpoint, token, project)

  project_id = project_information["id"]

  puts "\nThe project of the #{project} ID is #{project_id}"

  url, information = endpoint + "/projects/#{project_id}/services/slack?private_token=#{token}", payload(channel, webhook)

  gitlab_integration_slack(url, information)

end
