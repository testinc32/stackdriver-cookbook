
actions :run
default_action :run

attribute :revision_id, :kind_of => String, :name_attribute => true
attribute :deployed_to, :kind_of => String, :default => node.chef_environment
attribute :deployed_by, :kind_of => [String, NilClass], :default => 'chef-client'
attribute :repository, :kind_of => [String, NilClass], :default => nil
