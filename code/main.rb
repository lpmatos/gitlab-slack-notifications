# =============================================================================
# CLASS - REQUIRES
# =============================================================================

require_relative "./utils/reader.rb"
require_relative "./settings/configuration.rb"
require_relative "./settings/log.rb"
require_relative "./settings/arguments.rb"

# =============================================================================
# MAIN
# =============================================================================

if __FILE__ == $0

  configuration = Configuration.new
  logger = Log.instance
  yml_reader = ReaderYMLFile.new("values.yml")
  options = command_line_parser()

  values = yml_reader.get_content
  gitlab, slack = values["gitlab"], values["slack"]

  gitlab_endpoint = options["endpoint"] ?
    options["endpoint"] : ((!gitlab["endpoint"].to_s.empty? && !gitlab["endpoint"].nil?) ?
    gitlab["endpoint"] : configuration.gitlab_endpoint)

  gitlab_token = options["token"] ?
    options["token"] : ((!gitlab["token"].to_s.empty? && !gitlab["token"].nil?) ?
    gitlab["token"] : configuration.gitlab_token)

  gitlab_project = options["project"] ?
    options["project"] : ((!gitlab["project"].to_s.empty? && !gitlab["project"].nil?) ?
    gitlab["project"] : configuration.gitlab_project)

  slack_channel = options["channel"] ?
    options["channel"] : ((!slack["channel"].to_s.empty? && !slack["channel"].nil?) ?
    slack["channel"] : configuration.slack_channel)

  slack_webhook = options["webhook"] ?
    options["webhook"] : ((!slack["webhook"].to_s.empty? && !slack["webhook"].nil?) ?
    slack["webhook"] : configuration.slack_webhook)

  puts "\nEndpoint: #{gitlab_endpoint}"
  puts "Token: #{gitlab_token}"
  puts "Project: #{gitlab_project}"
  puts "Channel: #{slack_channel}"
  puts "Webhook: #{slack_webhook}\n"
end
