require 'fog/core/model'

module Fog
  module Linode
    class Compute
      # Read-only model for Linode images
      class Image < Fog::Model
        identity :id

        attribute :label
        attribute :created
        attribute :created_by
        attribute :deprecated
        attribute :description
        attribute :is_public
        attribute :size
        attribute :type
        attribute :expiry
        attribute :vendor
      end
    end
  end
end
