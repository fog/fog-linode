module Fog
  module Linode
    # Fog service class for Linode DNS service
    class DNS < Fog::Service
      requires :linode_token

      request_path 'fog/linode/dns/requests'
      request :create_domain
      request :list_domains
      request :view_domain
      request :update_domain
      request :delete_domain
      request :create_domain_record
      request :list_domain_records
      request :view_domain_record
      request :update_domain_record
      request :delete_domain_record

      model_path 'fog/linode/dns/models'
      collection :domains
      model :domain
      collection :domain_records
      model :domain_record

      # Real implementation for Linode DNS service
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
