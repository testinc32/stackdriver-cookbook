
use_inline_resources

action :enable do
  stackdriver_plugin "mongodb" do
    settings({
      :host => new_resource.host,
      :port => new_resource.port,
      :username => new_resource.username,
      :password => new_resource.password,
      :allow_secondary_query => new_resource.allow_secondary_query
    })
  end
end

action :disable do
  stackdriver_plugin "mongodb" do
    action :disable
  end
end
