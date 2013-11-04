
actions :enable, :disable
default_action :enable

attribute :database, :kind_of => String, :name_attribute => true
attribute :host, :kind_of => String, :default => 'localhost'
attribute :port, :kind_of => [String, Integer], :default => 3306
attribute :username, :kind_of => String
attribute :password, :kind_of => String

