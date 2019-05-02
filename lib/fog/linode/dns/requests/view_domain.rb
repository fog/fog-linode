module Fog
  module Linode
    class DNS
      # This class provides the actual implementation for service calls
      class Real
        def view_domain(id, options = {})
          response = request(
            expects: [200],
            method: 'GET',
            path: "domains/#{id}",
            query: options
          )
          response.body
        end
      end
    end
  end
end
