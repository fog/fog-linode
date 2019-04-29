module Fog
  module Linode
    class Compute
      # This class provides the actual implementation for service calls
      class Real
        def list_types(options = {})
          response = request(
            expects: [200],
            method: 'GET',
            path: 'linode/types',
            query: options
          )

          response.body['data']
        end
      end
    end
  end
end
