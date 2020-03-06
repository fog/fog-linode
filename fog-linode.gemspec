lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'fog/linode/version'

Gem::Specification.new do |spec|
  spec.name          = 'fog-linode'
  spec.version       = Fog::Linode::VERSION
  spec.authors       = ['Charles Treatman']
  spec.email         = ['charles.treatman@gmail.com']

  spec.summary       = "Module for the 'fog' gem to support Linode cloud services."
  spec.description   = "This library can be used as a module for 'fog' or as standalone provider
                        to use the Linode cloud services in applications."
  spec.homepage      = 'https://github.com/Linode/fog-linode'

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler'
  spec.add_development_dependency 'minitest', '~> 5.0'
  spec.add_development_dependency 'mocha'
  spec.add_development_dependency 'rake', '>= 12.3.3'
  spec.add_development_dependency 'rubocop'
  spec.add_development_dependency 'simplecov'
  spec.add_development_dependency 'vcr'
  spec.add_development_dependency 'webmock'

  spec.add_dependency 'fog-core', '~> 1.43'
  spec.add_dependency 'fog-json', '~> 1.0.2'
end
