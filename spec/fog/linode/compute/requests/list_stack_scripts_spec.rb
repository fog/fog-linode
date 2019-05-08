require 'minitest_helper'

describe Fog::Linode::Compute do
  describe '#list_stack_scripts' do
    before do
      VCR.insert_cassette('list_stack_scripts')
    end

    after do
      VCR.eject_cassette
    end

    let(:connection) do
      Fog::Compute.new(
        provider: :linode,
        linode_token: ENV['LINODE_TOKEN'] || 'fake_token'
      )
    end

    it 'lists existing Linode StackScripts' do
      stack_scripts = connection.list_stack_scripts
      assert !stack_scripts.empty?
      assert !stack_scripts.first['user_defined_fields'].nil?
    end
  end
end
