def gitlab_project(endpoint, private_token, project_name)
  Gitlab.configure do |configuration|
    configuration.endpoint = endpoint
    configuration.private_token = private_token
  end
  return Gitlab.project(project_name).to_h
end
