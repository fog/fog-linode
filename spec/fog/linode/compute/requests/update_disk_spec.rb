require 'minitest_helper'

describe Fog::Linode::Compute do
  describe '#update_disk' do
    before do
      VCR.insert_cassette('update_disk')
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

    it 'updates the specified disk' do
      server_id = 14022202
      disk_id = 29200416
      disk = connection.update_disk(server_id,
                                    disk_id,
                                    label: 'update_disk_spec')
      assert_equal disk['id'], disk_id
      assert_equal disk['label'], 'update_disk_spec'
    end
  end
end
