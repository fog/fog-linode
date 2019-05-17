module Fog
  module Linode
    # Fog service class for Linode Compute service
    class Compute < Fog::Service
      requires :linode_token

      request_path 'fog/linode/compute/requests'
      request :list_types
      request :view_type
      request :list_kernels
      request :view_kernel
      request :list_regions
      request :view_region
      request :list_stack_scripts
      request :view_stack_script
      request :list_images
      request :view_image
      request :create_server
      request :list_servers
      request :view_server
      request :update_server
      request :delete_server
      request :create_disk
      request :list_disks
      request :view_disk
      request :update_disk
      request :delete_disk

      model_path 'fog/linode/compute/models'
      collection :types
      model :type
      collection :kernels
      model :kernel
      collection :regions
      model :region
      collection :servers
      model :server
      collection :stack_scripts
      model :stack_script
      collection :images
      model :image

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
