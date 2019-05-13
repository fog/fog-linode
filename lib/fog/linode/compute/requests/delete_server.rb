module Fog
  module Linode
    class Compute
      # This class provides the actual implementation for service calls
      class Real
        def delete_server(id)
          response = request(
            expects: [200],
            method: 'DELETE',
            path: "linode/instances/#{id}"
          )
          response.body
        end
      end
    end
  end
end
