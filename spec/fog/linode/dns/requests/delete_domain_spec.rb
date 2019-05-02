require 'minitest_helper'

describe Fog::Linode::DNS do
  describe '#delete_domain' do
    before do
      VCR.insert_cassette('delete_domain')
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

    it 'deletes the specified Linode domain' do
      domain_response = connection.delete_domain(1228336)
      assert_empty domain_response
    end
  end
end
