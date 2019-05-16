require 'minitest_helper'

describe Fog::Linode::Compute do
  describe '#list_disks' do
    before do
      VCR.insert_cassette('list_disks')
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

    it 'lists existing disks for the specified Linode instance' do
      linode_id = 14022202
      disks = connection.list_disks(linode_id)
      assert !disks.empty?
      assert !disks.first['filesystem'].nil?
    end
  end
end
