require 'minitest_helper'

describe Fog::Linode::DNS do
  describe '#list_domain_records' do
    before do
      VCR.insert_cassette('list_domain_records')
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
      domain_id = 1231330
      domain_records = connection.list_domain_records(domain_id)
      assert !domain_records.empty?
      assert !domain_records.first['type'].nil?
    end
  end
end
