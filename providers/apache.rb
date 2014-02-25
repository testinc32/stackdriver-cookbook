
use_inline_resources

action :enable do
  stackdriver_plugin "apache" do
    settings({
      :name => new_resource.name,
      :url => new_resource.url,
      :username => new_resource.username,
      :password => new_resource.password
    })
  end
end

action :disable do
  stackdriver_plugin "apache" do
    action :disable
  end
end
