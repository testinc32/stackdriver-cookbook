
action :enable do
  raise "StackDriver plugins cannot be enabled for nodes which are not on Amazon EC2" if !ec2?
  raise "StackDriver plugins cannot be enabled for nodes without the stackdriver agent" if !node[:stackdriver][:enable]

  t = template "#{node[:stackdriver][:plugin_path]}/#{new_resource.plugin_name}.conf" do
    source "#{new_resource.plugin_name}.conf.erb"
    cookbook 'stackdriver'
    user new_resource.user
    group new_resource.group
    variables new_resource.settings
    notifies :restart, 'service[stackdriver-agent]'
  end

  new_resource.updated_by_last_action(t.updated_by_last_action?)
end

action :disable do
  f = file "#{node[:stackdriver][:plugin_path]}/#{new_resource.plugin_name}.conf" do
    action :delete
    notifies :restart, 'service[stackdriver-agent]'
  end

  new_resource.updated_by_last_action(f.updated_by_last_action?)
end
