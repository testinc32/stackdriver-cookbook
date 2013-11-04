
default[:stackdriver][:fail_silently] = false
default[:stackdriver][:api_key] = nil
default[:stackdriver][:config_collectd] = true
default[:stackdriver][:gpg_key] = 'https://www.stackdriver.com/RPM-GPG-KEY-stackdriver'
default[:stackdriver][:plugin_path] = '/opt/stackdriver/collectd/etc/collectd.d'
default[:stackdriver][:event_gateway] = 'https://event-gateway.stackdriver.com/v1'
default[:stackdriver][:deploy_event_url] = "#{node[:stackdriver][:event_gateway]}/deployevent"
default[:stackdriver][:annotation_event_url] = "#{node[:stackdriver][:event_gateway]}/annotationevent"

case node[:platform]
when 'amazon'
  default[:stackdriver][:repo_url] = 'http://repo.stackdriver.com/stackdriver-amazonlinux.repo'
  default[:stackdriver][:config_path] = '/etc/sysconfig/stackdriver'
when 'redhat', 'centos'
  default[:stackdriver][:repo_url] = 'http://repo.stackdriver.com/stackdriver.repo'
  default[:stackdriver][:config_path] = '/etc/sysconfig/stackdriver'
when 'ubuntu'
  case node[:platform_version]
  when '10.04'
    default[:stackdriver][:repo_url] = 'http://repo.stackdriver.com/apt'
    default[:stackdriver][:repo_dist] = 'lucid'
    default[:stackdriver][:config_path] = '/etc/default/stackdriver-agent'
  when '12.04', '12.10'
    default[:stackdriver][:repo_url] = 'http://repo.stackdriver.com/apt'
    default[:stackdriver][:repo_dist] = 'precise'
    default[:stackdriver][:config_path] = '/etc/default/stackdriver-agent'
  end
end

case node[:platform]
when "debain", "ubuntu"
  default[:stackdriver][:hiredis] = 'libhiredis0.10'
else
  default[:stackdriver][:hiredis] = 'hiredis'
end
