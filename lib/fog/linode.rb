require 'fog/core'
require 'fog/json'
require 'fog/linode/version'

module Fog
  # Autoload Module for Compute
  module Compute
    autoload :Linode, File.expand_path('linode/compute', __dir__)
  end

  module Linode
    extend Fog::Provider
    service(:compute, 'Compute')
  end
end