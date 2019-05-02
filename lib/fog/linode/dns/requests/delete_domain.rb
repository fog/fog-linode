module Fog
  module Linode
    class DNS
      # This class provides the actual implementation for service calls
      class Real
        def delete_domain(id)
          response = request(
            expects: [200],
            method: 'DELETE',
            path: "domains/#{id}"
          )
          response.body
        end
      end
    end
  end
end
