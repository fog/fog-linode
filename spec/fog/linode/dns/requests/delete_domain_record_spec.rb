require 'minitest_helper'

describe Fog::Linode::DNS do
  describe '#delete_domain_record' do
    before do
      VCR.insert_cassette('delete_domain_record')
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
      domain_id = 1231330
      domain_record_id = 12777316
      response = connection.delete_domain_record(domain_id, domain_record_id)
      assert_empty response
    end
  end
end
