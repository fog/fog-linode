require 'minitest_helper'

describe Fog::Linode::Compute do
  describe '#list_images' do
    before do
      VCR.insert_cassette('list_images')
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

    it 'lists existing Linode images' do
      images_response = connection.list_images
      assert !images_response.empty?
      assert !images_response.first['label'].nil?
    end
  end
end
