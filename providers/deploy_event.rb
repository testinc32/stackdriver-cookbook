
action :run do
  if node[:stackdriver][:api_key].nil?
    raise "You must specify your StackDriver API as a node attribute key to trigger deploy events"
  end

  http_request "StackDriver deploy event" do
    url node[:stackdriver][:deploy_event_url]
    headers({
      'content-type' => 'application/json',
      'x-stackdriver-apikey' => node[:stackdriver][:api_key]
    })
    message({
      :revision_id => new_resource.revision_id,
      :deployed_by => new_resource.deployed_by,
      :deployed_to => new_resource.deployed_to,
      :repository => new_resource.repository
    }.delete_if{ |k,v| v.nil? })
    action :post
  end
end
