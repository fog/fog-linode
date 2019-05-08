require 'fog/core/collection'
require 'fog/linode/compute/models/type'

module Fog
  module Linode
    class DNS
      # Collection class for loading Type models from Linode instance type data
      class DomainRecords < Fog::Collection
        model DomainRecord

        def all(domain_id, options = {})
          domain_records = service.list_domain_records(domain_id, options)
          load(domain_records.map { |domain_record| add_domain_id(domain_id, domain_record) })
        end

        def get(domain_id, domain_record_id)
          domain_record = service.view_domain_record(domain_id, domain_record_id)
          new add_domain_id(domain_id, domain_record)
        end

        private

        def add_domain_id(domain_id, domain_record)
          domain_record['domain_id'] = domain_id
          domain_record
        end
      end
    end
  end
end
