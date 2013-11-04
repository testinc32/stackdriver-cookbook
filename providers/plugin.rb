
action :enable do
  raise "StackDriver plugins cannot be enabled for nodes which are not on Amazon EC2" if !is_ec2? and not fail_silently?

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


private

def is_ec2?
  if !node.attribute?(:ec2) && !node.attribute?(:cloud)
    false
  else
    node[:cloud][:provider] == 'ec2'
  end
end

def fail_silently?
  node[:stackdriver][:fail_silently]
end
