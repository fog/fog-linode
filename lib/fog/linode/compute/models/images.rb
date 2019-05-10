require 'fog/core/collection'
require 'fog/linode/compute/models/kernel'

module Fog
  module Linode
    class Compute
      # Collection class for loading Image models from Linode image data
      class Images < Fog::Collection
        model Image

        def all(options = {})
          images = service.list_images(options)
          load images
        end

        def get(id)
          image = service.view_image(id)
          new image
        end
      end
    end
  end
end
