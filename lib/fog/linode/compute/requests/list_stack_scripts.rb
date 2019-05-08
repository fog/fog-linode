require 'fog/linode/paginated_collection'

module Fog
  module Linode
    class Compute
      # This class provides the actual implementation for service calls
      class Real
        include PaginatedCollection

        def list_stack_scripts(options = {})
          make_paginated_request('linode/stackscripts', options)
        end
      end
    end
  end
end
