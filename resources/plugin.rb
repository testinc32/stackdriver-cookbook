
actions :enable, :disable
default_action :enable

attribute :plugin_name, :kind_of => String, :name_attribute => true
attribute :settings, :kind_of => Hash, :default => Hash.new
attribute :user, :regex => Chef::Config[:user_valid_regex], :default => 'root'
attribute :group, :regex => Chef::Config[:group_valid_regex], :default => 'root'
