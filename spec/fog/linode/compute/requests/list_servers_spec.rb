require 'minitest_helper'

describe Fog::Linode::Compute do
  describe '#list_servers' do
    before do
      VCR.insert_cassette('list_servers')
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
      images_response = connection.list_servers
      assert !images_response.empty?
      assert !images_response.first['id'].nil?
    end
  end
end
