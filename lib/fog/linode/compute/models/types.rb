require 'fog/core/collection'
require 'fog/linode/compute/models/type'

module Fog
  module Linode
    class Compute
      # Collection class for loading Type models from Linode instance type data
      class Types < Fog::Collection
        model Type

        def all(options = {})
          types = service.list_types(options)
          load types
        end

        def get(id)
          type = service.view_type(id)
          new type
        end
      end
    end
  end
end
