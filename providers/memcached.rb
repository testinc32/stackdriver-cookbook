
action :enable do
  p = stackdriver_plugin "memcached" do
    settings({
      :host => new_resource.host,
      :port => new_resource.port
    })
  end

  new_resource.updated_by_last_action(p.updated_by_last_action?)
end

action :disable do
  p = stackdriver_plugin "memcached" do
    action :disable
  end

  new_resource.updated_by_last_action(p.updated_by_last_action?)
end
