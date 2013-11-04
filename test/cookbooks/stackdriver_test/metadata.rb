name              "stackdriver_test"
maintainer        "ChatID"
maintainer_email  "wright@chatid.com"
license           "Apache 2.0"
description       "This cookbook is used with test-kitchen to test the parent, stackdriver cookbok"
version           "1.0.0"

%w{stackdriver memcached nginx redis}.each do |cb|
  depends cb
end
