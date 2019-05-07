require 'minitest_helper'

describe Fog::Linode::DNS do
  describe '#create_domain_record' do
    before do
      VCR.insert_cassette('create_domain_record')
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

    it 'creates a Linode domain record' do
      domain_id = 1231330
      domain_record = connection.create_domain_record(domain_id,
                                                      type: 'CNAME',
                                                      name: 'alias.charlestreatman.com',
                                                      target: 'original.charlestreatman.com')
      assert !domain_record['id'].nil?
      assert_equal domain_record['type'], 'CNAME'
    end
  end
end
