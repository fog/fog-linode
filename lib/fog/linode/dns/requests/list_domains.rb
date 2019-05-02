module Fog
  module Linode
    class DNS
      # This class provides the actual implementation for service calls
      class Real
        def list_domains(options = {})
          response = request(
            expects: [200],
            method: 'GET',
            path: 'domains',
            query: options
          )

          response.body['data']
        end
      end
    end
  end
end
