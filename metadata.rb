name             'awscreds'
maintainer       'Chef Software, Inc.'
maintainer_email 'cookbooks@getchef.com'
license          'Apache 2.0'
description      'Creates /root/.aws/config from chef-vault'
long_description %(
  Loads credentials from chef vault and creates an aws config file (.ini
  format) from the loaded credentials. Supports multiple profiles and
  alternate locations for the credentials file.)
version          '0.1.0'

depends 'chef-vault'
