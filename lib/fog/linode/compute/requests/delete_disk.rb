module Fog
  module Linode
    class Compute
      # This class provides the actual implementation for service calls
      class Real
        def delete_disk(linode_id, disk_id)
          response = request(
            expects: [200],
            method: 'DELETE',
            path: "linode/instances/#{linode_id}/disks/#{disk_id}"
          )
          response.body
        end
      end
    end
  end
end
