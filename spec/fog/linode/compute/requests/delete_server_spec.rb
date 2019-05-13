require 'minitest_helper'

describe Fog::Linode::Compute do
  describe '#delete_server' do
    before do
      VCR.insert_cassette('delete_server')
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

    it 'deletes the specified Linode instace' do
      server_response = connection.delete_server(13985782)
      assert_empty server_response
    end
  end
end
