
actions :enable, :disable
default_action :enable

attribute :host, :kind_of => String, :default => '127.0.0.1'
attribute :port, :kind_of => [String, Integer], :default => 11211
