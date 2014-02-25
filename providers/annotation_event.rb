
action :run do
  if node[:stackdriver][:api_key].nil?
    raise "You must specify your StackDriver API as a node attribute key to trigger deploy events"
  end

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
