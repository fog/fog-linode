module Fog
  module Linode
    class Compute
      # This class provides the actual implementation for service calls
      class Real
        def view_type(id, options = {})
          response = request(
            expects: [200],
            method: 'GET',
            path: "linode/types/#{id}",
            query: options
          )
          Fog::JSON.decode(response.body)
        end
      end
    end
  end
end
