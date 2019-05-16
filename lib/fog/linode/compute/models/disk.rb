module Fog
  module Linode
    class Compute
      # Model for Linode instance disks
      class Disk < Fog::Model
        identity :id

        attribute :server_id
        attribute :label
        attribute :status
        attribute :size
        attribute :filesystem
        attribute :created
        attribute :updated

        # Attributes for Disk creation (not supported on view/update)
        attribute :read_only
        attribute :image
        attribute :authorized_keys
        attribute :authorized_users
        attribute :root_pass
        attribute :stackscript_id

        def save
          if identity.nil?
            merge_attributes(service.create_disk(server_id, attributes))
          else
            merge_attributes(service.update_disk(server_id, identity, attributes_for_update))
          end
        end

        def destroy
          requires :identity
          service.delete_disk(identity)
        end

        private

        def attributes_for_update
          supported_attributes = %i[label filesystem]
          attributes.dup.select { |key| supported_attributes.include? key }
        end
      end
    end
  end
end
