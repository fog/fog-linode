require 'simplecov'
require 'minitest/spec'
require 'minitest/autorun'
require 'mocha/minitest'
require 'vcr'

VCR.configure do |c|
  c.cassette_library_dir = 'spec/cassettes'
  c.hook_into :webmock
  c.filter_sensitive_data('<LINODE_TOKEN>') { ENV['LINODE_TOKEN'] }
end

SimpleCov.start do
  add_filter '/spec/'
end

require File.expand_path('../lib/fog/linode.rb', __dir__)
