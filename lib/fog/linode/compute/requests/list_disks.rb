module Fog
  module Linode
    class Compute
      # This class provides the actual implementation for service calls
      class Real
        include PaginatedCollection

        def list_disks(linode_id, options = {})
          make_paginated_request("linode/instances/#{linode_id}/disks", options)
        end
      end
    end
  end
end
