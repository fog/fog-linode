require 'fog/core'
require 'fog/json'
require 'fog/linode/version'
require 'fog/linode/service'

module Fog
  # Main Linode fog provider module
  module Linode
    extend Fog::Provider

    autoload :Compute, File.expand_path('linode/compute', __dir__)
    autoload :DNS, File.expand_path('linode/dns', __dir__)

    service(:compute, 'Compute')
    service(:dns, 'DNS')
  end
end
