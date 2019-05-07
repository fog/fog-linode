require 'minitest_helper'

describe Fog::Linode::Compute do
  describe '#view_region' do
    before do
      VCR.insert_cassette('view_region')
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

    it 'loads the specified region' do
      region = connection.view_region('ap-northeast')
      assert_equal region['id'], 'ap-northeast'
      assert_equal region['country'], 'jp'
    end
  end
end
