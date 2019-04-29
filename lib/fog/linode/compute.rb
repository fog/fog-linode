module Fog
  module Linode
    # Fog service class for Linode Compute service
    class Compute < Fog::Service
      requires :linode_token

      request_path 'fog/linode/compute/requests'
      request :list_types
      request :view_type

      model_path 'fog/linode/compute/models'
      collection :types
      model :type

      # Real implementation for Linode Compute service
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
