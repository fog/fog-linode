require 'minitest_helper'

describe Fog::Linode::DNS do
  describe '#view_domain' do
    before do
      VCR.insert_cassette('view_domain')
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
      domain_response = connection.view_domain(1228336)
      assert_equal domain_response['id'].to_i, 1228336
      assert !domain_response['description'].nil?
    end
  end
end
