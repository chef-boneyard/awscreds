name 'awscreds'
maintainer 'Chef Software, Inc.'
maintainer_email 'cookbooks@chef.io'
license 'Apache-2.0'
description 'Creates /root/.aws/config from chef-vault'
long_description %(
  Loads credentials from chef vault and creates an aws config file (.ini
  format) from the loaded credentials. Supports multiple profiles and
  alternate locations for the credentials file.)
version '1.0.0'

depends 'chef-vault'

source_url 'https://github.com/chef-cookbooks/awscreds'
issues_url 'https://github.com/chef-cookbooks/awscreds/issues'
chef_version '>= 12.1' if respond_to?(:chef_version)
