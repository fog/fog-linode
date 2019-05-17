module Fog
  module Linode
    class Compute
      # This class provides the actual implementation for service calls
      class Real
        def view_disk(linode_id, disk_id, _options = {})
          response = request(
            expects: [200],
            method: 'GET',
            path: "linode/instances/#{linode_id}/disks/#{disk_id}",
            headers: {
              'Content-Type' => 'application/json'
            }
          )

          response.body
        end
      end
    end
  end
end
