require 'fog/core/collection'
require 'fog/linode/compute/models/kernel'

module Fog
  module Linode
    class Compute
      # Collection class for loading Server models from Linode instance data
      class Servers < Fog::Collection
        model Server

        def all(options = {})
          servers = service.list_servers(options)
          load servers
        end

        def get(id)
          server = service.view_server(id)
          new server
        end
      end
    end
  end
end
