require 'minitest_helper'

describe Fog::Linode::Compute do
  describe '#view_stack_script' do
    before do
      VCR.insert_cassette('view_stack_script')
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

    it 'loads the specified kernel' do
      stack_script = connection.view_stack_script(9217)
      assert_equal stack_script['id'], 9217
      assert_equal stack_script['label'], 'SiteDove powered by Webuzo'
    end
  end
end
