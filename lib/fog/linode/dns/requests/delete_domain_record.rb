module Fog
  module Linode
    class DNS
      # This class provides the actual implementation for service calls
      class Real
        def delete_domain_record(domain_id, domain_record_id)
          response = request(
            expects: [200],
            method: 'DELETE',
            path: "domains/#{domain_id}/records/#{domain_record_id}"
          )
          response.body
        end
      end
    end
  end
end
