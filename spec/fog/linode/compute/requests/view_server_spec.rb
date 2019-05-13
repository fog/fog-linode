require 'minitest_helper'

describe Fog::Linode::Compute do
  describe '#view_server' do
    before do
      VCR.insert_cassette('view_server')
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
      image_response = connection.view_server(13985782)
      assert_equal image_response['id'], 13985782
      assert_equal image_response['label'], 'centos-us-central'
    end
  end
end
