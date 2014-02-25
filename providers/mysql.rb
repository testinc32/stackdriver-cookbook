
use_inline_resources

action :enable do
  stackdriver_plugin "mysql" do
    settings({
      :database => new_resource.database,
      :host => new_resource.host,
      :port => new_resource.port,
      :username => new_resource.username,
      :password => new_resource.password
    })
  end
end

action :disable do
  stackdriver_plugin "mysql" do
    action :disable
  end
end
