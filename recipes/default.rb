#
# Cookbook Name:: stackdriver
# Recipe:: default
#
# Copyright 2013, ChatID
#
# All rights reserved - Do Not Redistribute
#

raise 'There does not appear to be a repository available for your platform.' unless node[:stackdriver][:repo_url]
raise 'You have not set the StackDriver API key in the node attributes' if node[:stackdriver][:api_key].nil?

return if !node[:stackdriver][:enable]

case node[:platform]
when 'rhel', 'centos', 'amazon'
  remote_file "/etc/yum.repos.d/stackdriver.repo" do
    source node[:stackdriver][:repo_url]
  end

  package 'stackdriver-agent'
when 'ubuntu'
  apt_repository 'stackdriver' do
    uri node[:stackdriver][:repo_url]
    distribution node[:stackdriver][:repo_dist]
    components ['main']
    key 'https://www.stackdriver.com/RPM-GPG-KEY-stackdriver'
  end

  bash "install stackdriver agent" do
    code <<-EOH
      echo "stackdriver-agent stackdriver-agent/apikey string #{node[:stackdriver][:api_key]}" | debconf-set-selections
      apt-get -y install stackdriver-agent
    EOH
    creates '/opt/stackdriver/collectd/sbin/stackdriver-collectd'
  end
end

service 'stackdriver-agent' do
  supports :start => true, :stop => true, :status => true, :restart => true, :reload => true
  action :enable
end

template node[:stackdriver][:config_path] do
  source 'stackdriver-agent.erb'
  variables ({
    :api_key => node[:stackdriver][:api_key],
    :collectd => node[:stackdriver][:config_collectd]
  })
  notifies :restart, 'service[stackdriver-agent]', :immediately
end
