module Fog
  module Compute
    class Linode
      # This class provides the actual implementation for service calls
      class Real
        def list_types(options = {})
          response = request(
            expects: [200],
            method: 'GET',
            path: 'linode/types',
            query: options
          )

          Fog::JSON.decode(response.body)['data']
        end
      end
    end
  end
end
