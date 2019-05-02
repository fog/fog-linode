require 'fog/core/collection'
require 'fog/linode/compute/models/type'

module Fog
  module Linode
    class DNS
      # Collection class for loading Type models from Linode instance type data
      class Domains < Fog::Collection
        model Domain

        def all(options = {})
          domains = service.list_domains(options)
          load domains
        end

        def get(id)
          domain = service.view_domain(id)
          new domain
        end
      end
    end
  end
end
