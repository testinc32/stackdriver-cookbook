
action :enable do
  p = stackdriver_plugin "apache" do
    settings({
      :name => new_resource.name,
      :url => new_resource.url,
      :username => new_resource.username,
      :password => new_resource.password
    })
  end

  new_resource.updated_by_last_action(p.updated_by_last_action?)
end

action :disable do
  p = stackdriver_plugin "apache" do
    action :disable
  end

  new_resource.updated_by_last_action(p.updated_by_last_action?)
end
