name             'stackdriver'
maintainer       'ChatID'
maintainer_email 'wright@chatid.com'
license          'All rights reserved'
description      'Installs/Configures stackdriver'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.2.0'

%w{apt chef-sugar}.each {|dep| depends dep}
