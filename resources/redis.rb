
actions :enable, :disable
default_action :enable

attribute :node_name, :kind_of => String, :name_attribute => true, :default => 'mynode'
attribute :host, :kind_of => String, :default => 'localhost'
attribute :port, :kind_of => Integer, :default => 6379
attribute :timeout, :kind_of => Integer, :default => 2000
