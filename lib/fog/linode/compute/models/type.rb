require 'fog/core/model'

module Fog
  module Compute
    class Linode
      # Read-only model for Linode instance types
      class Type < Fog::Model
        identity :id

        attribute :label
        attribute :disk
        # attribute :class TODO: need to figure out how to work around this
        attribute :price
        attribute :addons
        attribute :network_out
        attribute :memory
        attribute :successor
        attribute :transfer
        attribute :vcpus
      end
    end
  end
end
