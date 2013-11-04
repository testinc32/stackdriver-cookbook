
action :enable do
  p = stackdriver_plugin "mysql" do
    settings({
      :database => new_resource.database,
      :host => new_resource.host,
      :port => new_resource.port,
      :username => new_resource.username,
      :password => new_resource.password
    })
  end

  new_resource.updated_by_last_action(p.updated_by_last_action?)
end

action :disable do
  p = stackdriver_plugin "mysql" do
    action :disable
  end

  new_resource.updated_by_last_action(p.updated_by_last_action?)
end
