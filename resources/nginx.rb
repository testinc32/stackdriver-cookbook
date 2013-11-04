
actions :enable, :disable
default_action :enable

attribute :url, :kind_of => String, :default => 'http://localhost:8090/nginx_status'
attribute :username, :kind_of => [String, NilClass], :default => nil
attribute :password, :kind_of => [String, NilClass], :default => nil
