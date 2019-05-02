module Fog
  module Linode
    class DNS
      # This class provides the actual implementation for service calls
      class Real
        def update_domain(id, options = {})
          response = request(
            expects: [200],
            method: 'PUT',
            path: "domains/#{id}",
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
