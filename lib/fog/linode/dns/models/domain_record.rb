require 'fog/core/model'

module Fog
  module Linode
    class DNS
      # Model for Linode domain records
      class DomainRecord < Fog::Model
        identity :id

        attribute :domain_id
        attribute :type
        attribute :name
        attribute :target
        attribute :priority
        attribute :weight
        attribute :port
        attribute :service
        attribute :protocol
        attribute :ttl_sec
        attribute :tag

        # The `service` attribute of a Domain Record conflicts with the `service`
        # attribute of `Fog::Model`.  As a result, the `service` attribute for
        # this model class _does not represent_ the Linode API.  To work around
        # this, all API interactions for this model have to go through
        # `collection.service` instead of `service`.
        def save
          service = collection.service
          if identity.nil?
            merge_attributes(service.create_domain_record(domain_id, attributes))
          else
            merge_attributes(service.update_domain_record(domain_id, identity, attributes))
          end
        end
      end
    end
  end
end
