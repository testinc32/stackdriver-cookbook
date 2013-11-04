
actions :enable, :disable
default_action :enable

attribute :url, :kind_of => String, :default => 'http://127.0.0.1/mod_status?auto'
attribute :username, :kind_of => [String, NilClass], :default => nil
attribute :password, :kind_of => [String, NilClass], :default => nil
