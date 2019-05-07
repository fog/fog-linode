require 'minitest_helper'

describe Fog::Linode::DNS do
  describe '#view_domain_record' do
    before do
      VCR.insert_cassette('view_domain_record')
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

    it 'loads the specified domain record' do
      domain_id = 1231330
      domain_record_id = 12777316
      record = connection.view_domain_record(domain_id, domain_record_id)
      assert_equal record['id'], domain_record_id
      assert !record['type'].nil?
    end
  end
end
