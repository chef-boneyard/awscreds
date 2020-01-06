require 'spec_helper'

describe 'default recipe on Ubuntu' do
  let(:chef_run) do
    ChefSpec::ServerRunner.new(platform: 'ubuntu')
  end

  it 'converges successfully' do
    expect { :chef_run }.to_not raise_error
  end
end
