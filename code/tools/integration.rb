#!/usr/bin/ruby

# =============================================================================
# REQUIRES
# =============================================================================

require "gitlab"
require "json"
require "uri"
require "httparty"

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
