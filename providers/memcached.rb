
use_inline_resources

action :enable do
  stackdriver_plugin "memcached" do
    settings({
      :host => new_resource.host,
      :port => new_resource.port
    })
  end
end

action :disable do
  stackdriver_plugin "memcached" do
    action :disable
  end
end
