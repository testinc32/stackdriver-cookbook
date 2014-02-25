
actions :run
default_action :run

attribute :message, :kind_of => String, :name_attribute => true
attribute :level, :kind_of => String, :default => 'INFO'
attribute :annotated_by, :kind_of => [String, NilClass], :default => 'chef-client'
attribute :instance_id, :kind_of => [String, NilClass], :default => node.key?('ec2') ? node[:ec2][:instance_id] : nil
attribute :event_epoch, :kind_of => [String, NilClass], :default => nil
