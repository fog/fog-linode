require 'minitest_helper'

describe Fog::Linode::Compute do
  describe '#view_image' do
    before do
      VCR.insert_cassette('view_image')
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

    it 'loads the specified image' do
      image_response = connection.view_image('linode/ubuntu19.10')
      assert_equal image_response['id'], 'linode/ubuntu19.10'
      assert_equal image_response['label'], 'Ubuntu 19.04'
    end
  end
end
