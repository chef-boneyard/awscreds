# test::default
include_recipe 'chef-vault'

# Create an AWS key
chef_vault_secret 'default' do
  data_bag 'awscreds'
  search '*:*'
  admins ''
  raw_data('aws_access_key_id' => 'AAA...',
           'aws_secret_access_key' => 'AbC...')
end
