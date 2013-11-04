
actions :enable, :disable
default_action :enable

attribute :host, :kind_of => String, :default => '127.0.0.1'
attribute :port, :kind_of => [String, Integer], :default => 27017
attribute :username, :kind_of => [String, NilClass], :default => nil
attribute :password, :kind_of => [String, NilClass], :default => nil
attribute :allow_secondary_query, :kind_of => [TrueClass, FalseClass], :default => false
