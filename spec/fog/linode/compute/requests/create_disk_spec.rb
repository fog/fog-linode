require 'minitest_helper'

describe Fog::Linode::Compute do
  describe '#create_disk' do
    before do
      VCR.insert_cassette('create_disk')
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

    it 'creates a disk for the specified Linode instance' do
      server_id = 14022202
      disk = connection.create_disk(server_id,
                                    size: 10000,
                                    label: 'create_disk_spec')
      assert !disk['id'].nil?
      assert_equal disk['size'], 10000
    end
  end
end
