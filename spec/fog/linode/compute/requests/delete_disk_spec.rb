require 'minitest_helper'

describe Fog::Linode::Compute do
  describe '#delete_disk' do
    before do
      VCR.insert_cassette('delete_disk')
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

    it 'deletes the specified disk' do
      server_id = 14022202
      disk_id = 29200416
      response = connection.delete_disk(server_id, disk_id)
      assert_empty response
    end
  end
end
