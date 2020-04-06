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
