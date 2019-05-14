require 'minitest_helper'

describe Fog::Linode::Compute do
  describe '#update_server' do
    before do
      VCR.insert_cassette('update_server')
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

    it 'updates the specified Linode instance' do
      instance_id = 14003518
      server = connection.update_server(instance_id,
                                        tags: [
                                          'test-machine',
                                          'updated'
                                        ])
      assert !server['id'].nil?
    end
  end
end
