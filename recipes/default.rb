#
# Cookbook:: awscreds
# Recipe:: default
#
# Copyright:: 2014-2016, Chef Software Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

include_recipe 'chef-vault'

# Load the creedentials from chef vault
creds = {}
default_creds = nil
items = search(node['awscreds']['vault_name'],
               node['awscreds']['vault_search']).map(&:id)
items.each do |i|
  next if i.end_with?('_keys') # Skip vault metadata
  if i == node['awscreds']['default_profile']
    default_creds = chef_vault_item(node['awscreds']['vault_name'], i)
  else
    creds[i] = chef_vault_item(node['awscreds']['vault_name'], i)
  end
end

directory File.dirname(node['awscreds']['filename']) do
  recursive true
end

template node['awscreds']['filename'] do
  source 'config.erb'
  owner node['awscreds']['owner']
  group node['awscreds']['group']
  mode '0600'
  sensitive true
  variables creds: creds, default_creds: default_creds
end
