require 'serverspec'

include Serverspec::Helper::Exec
include Serverspec::Helper::DetectOS

describe 'awscreds::default' do
  describe file('/root/.aws') do
    it { should be_directory }
  end
  describe file('/root/.aws/config') do
    its(:content) {
      should eq File.read(
        File.expand_path('../test-output.txt', __FILE__))
    }
  end
end
