require 'minitest_helper'

describe Fog::Linode::Compute do
  describe '#view_disk' do
    before do
      VCR.insert_cassette('view_disk')
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

    it 'loads the specified disk' do
      server_id = 14022202
      disk_id = 29200416
      disk = connection.view_disk(server_id, disk_id)
      assert_equal disk['id'], disk_id
      assert !disk['filesystem'].nil?
    end
  end
end
