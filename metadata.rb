name             'awscreds'
maintainer       'Chef Software, Inc.'
maintainer_email 'cookbooks@chef.io'
license          'Apache 2.0'
description      'Creates /root/.aws/config from chef-vault'
long_description %(
  Loads credentials from chef vault and creates an aws config file (.ini
  format) from the loaded credentials. Supports multiple profiles and
  alternate locations for the credentials file.)
version          '0.1.0'

depends 'chef-vault'

source_url 'https://github.com/opscode-cookbooks/awscreds' if respond_to?(:source_url)
issues_url 'https://github.com/opscode-cookbooks/awscreds/issues' if respond_to?(:issues_url)
