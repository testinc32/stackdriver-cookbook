
actions :enable, :disable
default_action :enable

attribute :host, :kind_of => String, :default => 'localhost'
attribute :port, :kind_of => Integer, :default => 9200
