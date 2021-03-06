# =============================================================================
# CLASS - CONFIGURATION
# =============================================================================

class Configuration

  attr_reader :gitlab_endpoint,
                :gitlab_token,
                :gitlab_project,
                :slack_channel,
                :slack_webhook,
                :log_file

  def initialize()
    @gitlab_endpoint = ENV["GITLAB_ENDPOINT"]
    @gitlab_token = ENV["GITLAB_TOKEN"]
    @gitlab_project = ENV["GITLAB_PROJECT"]
    @slack_channel = ENV["SLACK_CHANNEL"]
    @slack_webhook = ENV["SLACK_WEBHOOK"]
    @log_file = ENV["LOG_FILE"]
  end

  def variables
    return {
      "gitlab_endpoint" => @gitlab_endpoint,
      "gitlab_token" => @gitlab_token,
      "gitlab_project" => @gitlab_project,
      "slack_channel" => @slack_channel,
      "slack_webhook" => @slack_webhook,
      "log_file" => @log_file
    }
  end

end
