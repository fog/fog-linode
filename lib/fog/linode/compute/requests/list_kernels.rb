require 'fog/linode/paginated_collection'

module Fog
  module Linode
    class Compute
      # This class provides the actual implementation for service calls
      class Real
        include PaginatedCollection

        def list_kernels(options = {})
          make_paginated_request('linode/kernels', options)
        end
      end
    end
  end
end
