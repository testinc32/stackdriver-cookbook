
action :enable do
  package node[:stackdriver][:hiredis]

  p = stackdriver_plugin "redis" do
    settings({
      :name => new_resource.node_name,
      :host => new_resource.host,
      :port => new_resource.port,
      :timeout => new_resource.timeout
    })
  end

  new_resource.updated_by_last_action(p.updated_by_last_action?)
end

action :disable do
  p = stackdriver_plugin "redis" do
    action :disable
  end

  new_resource.updated_by_last_action(p.updated_by_last_action?)
end
