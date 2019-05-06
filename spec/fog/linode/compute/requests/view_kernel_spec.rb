require 'minitest_helper'

describe Fog::Linode::Compute do
  describe '#view_kernel' do
    before do
      VCR.insert_cassette('view_kernel')
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
      kernel_response = connection.view_kernel('linode/finnix-legacy')
      assert_equal kernel_response['id'], 'linode/finnix-legacy'
      assert_equal kernel_response['label'], 'Recovery - Finnix (kernel)'
    end
  end
end
