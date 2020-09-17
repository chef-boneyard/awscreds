require 'serverspec'

set :backend, :exec

describe 'awscreds::default' do
  describe file('/root/.aws') do
    it { should be_directory }
  end
  describe file('/root/.aws/config') do
    its(:content) do
      should eq File.read(
        File.expand_path('test-output.txt', __dir__))
    end
  end
end
