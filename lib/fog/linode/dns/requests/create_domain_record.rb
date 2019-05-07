module Fog
  module Linode
    class DNS
      # This class provides the actual implementation for service calls
      class Real
        def create_domain_record(domain_id, options = {})
          response = request(
            expects: [200],
            method: 'POST',
            path: "domains/#{domain_id}/records",
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
