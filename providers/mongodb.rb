
action :enable do
  p = stackdriver_plugin "mongodb" do
    settings({
      :host => new_resource.host,
      :port => new_resource.port,
      :username => new_resource.username,
      :password => new_resource.password,
      :allow_secondary_query => new_resource.allow_secondary_query
    })
  end

  new_resource.updated_by_last_action(p.updated_by_last_action?)
end

action :disable do
  p = stackdriver_plugin "mongodb" do
    action :disable
  end

  new_resource.updated_by_last_action(p.updated_by_last_action?)
end
