require 'minitest_helper'

describe Fog::Linode::DNS do
  describe '#create_domain' do
    before do
      VCR.insert_cassette('create_domain')
    end

    after do
      VCR.eject_cassette
    end

    let(:connection) do
      Fog::DNS.new(
        provider: :linode,
        linode_token: ENV['LINODE_TOKEN'] || 'fake_token'
      )
    end

    it 'creates a Linode domain' do
      domain_response = connection.create_domain(
        type: 'master',
        domain: 'charlestreatman.com',
        description: 'testing Fog::Linode::DNS#create_domain',
        soa_email: 'fog-testing@example.com'
      )
      assert !domain_response['id'].nil?
    end
  end
end
