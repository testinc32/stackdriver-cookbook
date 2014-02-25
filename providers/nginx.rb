
use_inline_resources

action :enable do
  stackdriver_plugin "nginx" do
    settings({
      :url => new_resource.url,
      :username => new_resource.username,
      :password => new_resource.password
    })
  end
end

action :disable do
  stackdriver_plugin "nginx" do
    action :disable
  end
end
