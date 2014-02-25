StackDriver Cookbook
====================
This cookbook installs and configures the StackDriver agent. Additionally, it
providers various LWRPs for StackDriver agent plugins, and two additional LWRPs
for annotation events and deploy events.

Requirements
------------
### Platforms
- Amazon
- Debian, Ubuntu
- CentOS, Red Hat

### Cookbooks
- apt


Attributes
----------
See `attributes/default.rb` for default values.

- `node[:stackdriver][:enable]` If true enable the StackDriver agent
- `node[:stackdriver][:api_key]` Specifies the StackDriver API key to use
- `node[:stackdriver][:config_collectd]` If true autogenerate the stackdriver collectd config file
- `node[:stackdriver][:gpg_key]` The GPG key URL to use when installing on Ubuntu systems
- `node[:stackdriver][:plugin_path]` The collectd plugin path
- `node[:stackdriver][:event_gateway]` The StackDriver event gateway
- `node[:stackdriver][:deploy_event_url]` The StackDriver deploy event endpoint
- `node[:stackdriver][:annotation_event_url]` = The StackDriver annotation event endpoint

Usage
-----
### Recipes
#### stackdriver::default
Specify the `node['stackdriver']['api_key']` attribute and include the `stackdriver::default` recipe
in your node's run list.

### LWRPs
#### stackdriver_annotation_event

```
stackdriver_annotation_event "something happened!" do
  level :info
  annotated_by 'someone'
end
```

#### stackdriver_deploy_event

```
stackdriver_deploy_event "commit_hash" do
  repository "https://github.com/username/repo"
end
```

#### stackdriver_apache

```
stackdriver_apache "apache plugin" do
  url "http://127.0.0.1/mod_status?auto"
  username "admin"
  password "password"
end
```

#### stackdriver_elasticsearch

```
stackdriver_apache "stackdriver plugin" do
  host "localhost"
  port 9200
end
```

#### stackdriver_memcached

```
stackdriver_memcached "memcached plugin" do
  host "127.0.0.1"
  port 11211
end
```

#### stackdriver_mongodb

```
stackdriver_mongodb "mongodb plugin" do
  host '127.0.0.1'
  port 27017
  username 'admin'
  password 'password'
  allow_secondary_query true
end
```

#### stackdriver_mysql

```
stackdriver_mysql "mysql plugin" do
  database "production_db"
  host '127.0.0.1'
  port 3396
  username 'admin'
  password 'password'
end
```

#### stackdriver_nginx

```
stackdriver_nginx "nginx plugin" do
  url 'http://localhost:8090/nginx_status'
  username 'admin'
  password 'password'
end
```

#### stackdriver_redis

```
stackdriver_redis "redis plugin" do
  node_name 'mynode'
  host '127.0.0.1'
  port 6379
  timeout 2000
end
```

Contributing
------------
1. Fork the repository on Github
2. Create a named feature branch (like `add_component_x`)
3. Write you change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Submit a Pull Request using Github

License and Authors
-------------------
- Author: Matt Wright (matt@nobien.net)

```
Copyright:: 2014, Matt Wright

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
```
