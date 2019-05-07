require 'minitest_helper'

describe Fog::Linode::Compute do
  describe '#list_regions' do
    before do
      VCR.insert_cassette('list_regions')
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

    it 'lists existing Linode regions' do
      regions = connection.list_regions
      assert !regions.empty?
      assert !regions.first['country'].nil?
    end
  end
end
