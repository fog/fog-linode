require 'fog/core/collection'
require 'fog/linode/compute/models/kernel'

module Fog
  module Linode
    class Compute
      # Collection class for loading Kernel models from Linode instance kernel data
      class Kernels < Fog::Collection
        model Kernel

        def all(options = {})
          kernels = service.list_kernels(options)
          load kernels
        end

        def get(id)
          kernel = service.view_kernel(id)
          new kernel
        end
      end
    end
  end
end
