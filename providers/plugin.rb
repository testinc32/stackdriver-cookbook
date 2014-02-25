
use_inline_resources

action :enable do
  raise "StackDriver plugins cannot be enabled for nodes which are not on Amazon EC2" if !node.key?('ec2')
  raise "StackDriver plugins cannot be enabled for nodes without the stackdriver agent" if !node[:stackdriver][:enable]

  service "stackdriver-agent" do
    action :nothing
  end

  template "#{node[:stackdriver][:plugin_path]}/#{new_resource.plugin_name}.conf" do
    source "#{new_resource.plugin_name}.conf.erb"
    cookbook 'stackdriver'
    user new_resource.user
    group new_resource.group
    variables new_resource.settings
    notifies :restart, 'service[stackdriver-agent]'
  end
end

action :disable do
  service "stackdriver-agent" do
    action :nothing
  end

  file "#{node[:stackdriver][:plugin_path]}/#{new_resource.plugin_name}.conf" do
    action :delete
    notifies :restart, 'service[stackdriver-agent]'
  end
end
