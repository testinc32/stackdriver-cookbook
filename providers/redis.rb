
use_inline_resources

action :enable do
  package node[:stackdriver][:hiredis]

  stackdriver_plugin "redis" do
    settings({
      :name => new_resource.node_name,
      :host => new_resource.host,
      :port => new_resource.port,
      :timeout => new_resource.timeout
    })
  end
end

action :disable do
  stackdriver_plugin "redis" do
    action :disable
  end
end
