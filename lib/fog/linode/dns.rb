module Fog
  module Linode
    # Fog service class for Linode DNS service
    class DNS < Fog::Service
      requires :linode_token

      # Real implementation for Linode DNS service
      class Real < Service
      end

      # Mock service for unit tests
      # NOTE: we do not currently use this, but Fog throws an
      #       error if it's not defined for a Service class
      class Mock
        def initialize(_options = {}); end
      end
    end
  end
end
