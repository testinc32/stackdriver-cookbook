
action :run do
  if Chef::Config[:solo]
    Chef::Log.warn "#{new_resource} is not supported for chef-solo"
  elsif node[:stackdriver][:api_key].nil?
    raise "You must specify your StackDriver API as a node attribute key to trigger deploy events"
  else
    converge_by("Running #{new_resource}") do
      http_request "StackDriver annotation event" do
        url node[:stackdriver][:annotation_event_url]
        headers({
          'content-type' => 'application/json',
          'x-stackdriver-apikey' => node[:stackdriver][:api_key]
        })
        message({
          :message => new_resource.message,
          :level => new_resource.info,
          :annotated_by => new_resource.annotated_by,
          :instance_id => new_resource.instance_id,
          :event_epoch => new_resource.event_epoch
        }.delete_if{ |k,v| v.nil? })
        action :post
      end
    end
  end
end
