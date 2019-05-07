require 'fog/core/collection'
require 'fog/linode/compute/models/type'

module Fog
  module Linode
    class Compute
      # Collection class for loading Region models from Linode region data
      class Regions < Fog::Collection
        model Region

        def all
          regions = service.list_regions
          load regions
        end

        def get(id)
          region = service.view_region(id)
          new region
        end
      end
    end
  end
end
