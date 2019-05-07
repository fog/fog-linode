module Fog
  module Linode
    class Compute
      # This class provides the actual implementation for service calls
      class Real
        def view_region(id)
          response = request(
            expects: [200],
            method: 'GET',
            path: "regions/#{id}"
          )

          response.body
        end
      end
    end
  end
end
