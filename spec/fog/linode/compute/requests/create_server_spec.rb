require 'minitest_helper'

describe Fog::Linode::Compute do
  describe '#create_server' do
    before do
      VCR.insert_cassette('create_server')
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

    it 'creates a Linode instance' do
      server = connection.create_server(
        type: 'g6-dedicated-4',
        region: 'us-central',
        image: 'linode/ubuntu18.04',
        root_pass: 'not_a_real_password'
      )
      assert !server['id'].nil?
    end
  end
end
