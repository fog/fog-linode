require 'fog/core/model'

module Fog
  module Linode
    class Compute
      # Read-only model for Linode instance types
      class Type < Fog::Model
        identity :id

        attribute :label
        attribute :disk
        attribute :class_name
        attribute :price
        attribute :addons
        attribute :network_out
        attribute :memory
        attribute :successor
        attribute :transfer
        attribute :vcpus

        # Types have an attribute named `class`, which is a reserved word,
        # so we rename the attribute to `class_name` before initalization
        # to avoid runtime errors due to overwriting `class`
        def initialize(attributes = {})
          cleaned_attributes = attributes.dup
          cleaned_attributes[:class_name] = cleaned_attributes.delete('class')
          super(cleaned_attributes)
        end
      end
    end
  end
end
