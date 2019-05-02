require 'minitest_helper'

describe Fog::Linode::DNS do
  describe '#update_domain' do
    before do
      VCR.insert_cassette('update_domain')
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

    it 'lists existing Linode domains' do
      domain_description = 'the new domain description from Fog::Linode::DNS#update_domain'
      domain_response = connection.update_domain(1228336, description: domain_description)
      assert_equal domain_response['description'], domain_description
    end
  end
end
