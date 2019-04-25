require 'minitest_helper'

describe Fog::Linode::Compute do
  before do
    VCR.insert_cassette('types', record: :new_episodes)
  end

  after do
    VCR.eject_cassette
  end

  describe '#types' do
    let(:connection) do
      Fog::Compute.new(
        provider: :linode,
        linode_token: ENV['LINODE_TOKEN'] || 'fake_token'
      )
    end

    it 'lists the available instance types' do
      all_types = connection.types.all
      all_types.must_be_instance_of Fog::Linode::Compute::Types
      all_types.first.must_be_instance_of Fog::Linode::Compute::Type
    end

    it 'gets a specific instance type' do
      type = connection.types.get('g6-standard-4')
      type.must_be_instance_of Fog::Linode::Compute::Type
      type.id.must_equal 'g6-standard-4'
    end
  end
end
