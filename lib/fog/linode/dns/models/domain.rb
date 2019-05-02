require 'fog/core/model'

module Fog
  module Linode
    class DNS
      # Read-only model for Linode instance types
      class Domain < Fog::Model
        identity :id

        attribute :type
        attribute :domain
        attribute :group
        attribute :description
        attribute :status
        attribute :soa_email
        attribute :retry_sec
        attribute :master_ips
        attribute :axfr_ips
        attribute :expire_sec
        attribute :refresh_sec
        attribute :ttl_sec
        attribute :tags

        def save
          options = clean_attributes
          if identity.nil?
            merge_attributes(service.create_domain(options))
          else
            merge_attributes(service.update_domain(identity, options))
          end
        end

        private

        # The API returns "" for group, but does not accept that
        # value, so we have to remove it to avoid errors on update
        def clean_attributes
          return attributes if group.nil? || !group.empty?

          filtered_attributes = attributes.dup
          filtered_attributes.delete(:group)
        end
      end
    end
  end
end
