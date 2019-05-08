require 'fog/core/model'

module Fog
  module Linode
    class Compute
      # Read-only model for Linode StackScripts
      class StackScript < Fog::Model
        identity :id

        attribute :username
        attribute :user_gravatar_id
        attribute :label
        attribute :description
        attribute :images
        attribute :deployments_total
        attribute :deployments_active
        attribute :is_public
        attribute :created
        attribute :updated
        attribute :rev_note
        attribute :script
        attribute :user_defined_fields
      end
    end
  end
end
