require 'minitest_helper'

describe Fog::Linode::Compute do
  describe '#list_kernels' do
    before do
      VCR.insert_cassette('list_kernels')
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

    it 'lists existing Linode kernels' do
      kernels_response = connection.list_kernels
      assert !kernels_response.empty?
      assert !kernels_response.first['label'].nil?
    end
  end
end
