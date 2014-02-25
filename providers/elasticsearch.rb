
use_inline_resources

action :enable do
  package node[:stackdriver][:yajl]

  stackdriver_plugin "elasticsearch" do
    settings({
      :host => new_resource.host,
      :port => new_resource.port
    })
  end
end

action :disable do
  stackdriver_plugin "elasticsearch" do
    action :disable
  end
end
