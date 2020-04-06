# =============================================================================
# CLASS - REQUIRES
# =============================================================================

require_relative "./utils/reader.rb"
require_relative "./settings/configuration.rb"
require_relative "./settings/log.rb"

# =============================================================================
# MAIN
# =============================================================================

if __FILE__ == $0

  configuration = Configuration.new
  logger = Log.instance
  yml_reader = ReaderYMLFile.new("values.yml")

  values = yml_reader.get_content
  gitlab, slack = values["gitlab"], values["slack"]

  logger.info("Getting GitLab values...")

  gitlab_endpoint = gitlab["endpoint"] ||= configuration.gitlab_endpoint
  gitlab_token = gitlab["token"] ||= configuration.gitlab_token
  gitlab_project = gitlab["project"] ||= configuration.gitlab_project

  logger.info("Getting Slack values...")

  slack_channel = slack["channel"] ||= configuration.slack_channel
  slack_webhook = slack["webhook"] ||= configuration.slack_webhook

  logger.info("Show Values...")

  puts "\n#{gitlab_endpoint}"
  puts "#{gitlab_token}"
  puts "#{gitlab_project}"
  puts "#{slack_channel}"
  puts "#{slack_webhook}\n"
end
