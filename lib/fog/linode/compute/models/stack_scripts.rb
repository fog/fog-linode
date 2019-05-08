require 'fog/core/collection'
require 'fog/linode/compute/models/type'

module Fog
  module Linode
    class Compute
      # Collection class for loading StackScript models from Linode StackScript data
      class StackScripts < Fog::Collection
        model StackScript

        def all(options = {})
          stack_scripts = service.list_stack_scripts(options)
          load stack_scripts
        end

        def get(id)
          stack_script = service.view_stack_script(id)
          new stack_script
        end
      end
    end
  end
end
