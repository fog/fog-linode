require 'fog/core/model'

module Fog
  module Linode
    class Compute
      # Read-only model for Linode regions
      class Region < Fog::Model
        identity :id

        attribute :country
      end
    end
  end
end
