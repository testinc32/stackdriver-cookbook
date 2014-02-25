
include_recipe "memcached"
include_recipe "stackdriver::default"

stackdriver_plugin "memcached" do
  settings({:host => 'localhost', :port => 11211})
end
