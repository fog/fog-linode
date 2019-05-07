module Fog
  module Linode
    class Compute
      # This class provides the actual implementation for service calls
      class Real
        def list_regions
          response = request(
            expects: [200],
            method: 'GET',
            path: 'regions'
          )

          response.body['data']
        end
      end
    end
  end
end
