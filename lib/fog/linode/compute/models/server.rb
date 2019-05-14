require 'fog/core/model'

module Fog
  module Linode
    class Compute
      # Read-only model for Linode instances
      class Server < Fog::Model
        identity :id

        attribute :label
        attribute :region
        attribute :image
        attribute :type
        attribute :group
        attribute :tags
        attribute :status
        attribute :hypervisor
        attribute :created
        attribute :updated
        attribute :ipv4
        attribute :ipv6
        attribute :specs
        attribute :alerts
        attribute :backups
        attribute :watchdog_enabled

        # Attributes for creation (not available when viewing, not supported for update)
        attribute :backup_id
        attribute :backups_enabled
        attribute :swap_size
        attribute :root_pass
        attribute :authorized_keys
        attribute :stackscript_id
        attribute :stackscript_data
        attribute :booted
        attribute :private_ip
        attribute :authorized_users

        def save
          if identity.nil?
            merge_attributes(service.create_server(attributes))
          else
            merge_attributes(service.update_server(identity, attributes_for_update))
          end
        end

        private

        def attributes_for_update
          supported_attributes = %i[label group tags alerts backups watchdog_enabled]
          attributes.dup.select { |key| supported_attributes.include? key }
        end
      end
    end
  end
end
