module Fog
  module Linode
    class Compute
      # This class provides the actual implementation for service calls
      class Real
        def create_server(options = {})
          response = request(
            expects: [200],
            method: 'POST',
            path: 'linode/instances',
            body: Fog::JSON.encode(options),
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
