require 'fog/core/model'

module Fog
  module Linode
    class Compute
      # Read-only model for Linode kernels
      class Kernel < Fog::Model
        identity :id

        attribute :label
        attribute :version
        attribute :kvm
        attribute :xen
        attribute :architecture
        attribute :pvops
      end
    end
  end
end
