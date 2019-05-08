module Fog
  module Linode
    class Compute
      # This class provides the actual implementation for service calls
      class Real
        def view_stack_script(id)
          response = request(
            expects: [200],
            method: 'GET',
            path: "linode/stackscripts/#{id}"
          )
          response.body
        end
      end
    end
  end
end
