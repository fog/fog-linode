require 'fog/linode/paginated_collection'

module Fog
  module Linode
    class Compute
      # Collection class for loading Disk models from Linode instance disk data
      class Disks < Fog::Collection
        model Disk

        def all(server_id, options = {})
          disks = service.list_disks(server_id, options)
          load(disks.map { |disk| add_server_id(server_id, disk) })
        end

        def get(server_id, disk_id)
          disk = service.view_disk(server_id, disk_id)
          new add_server_id(server_id, disk)
        end

        private

        def add_server_id(server_id, disk)
          disk['server_id'] = server_id
          disk
        end
      end
    end
  end
end
