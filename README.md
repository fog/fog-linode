# Fog::Linode

This is the plugin Gem to talk to [Linode](https://linode.com) clouds via [`fog`](https://github.com/fog/fog).

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'fog-linode'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install fog-linode

## Usage

```ruby
require 'fog/linode'

compute = Fog::Compute.new(provider: :linode, linode_token: '<your LinodeAPIv4 access token>')
all_kernels = compute.kernels.all # Fetch all kernels from the Linode API
kvm_kernels = compute.kernels.all(filters: { kvm: true }) # Fetch all KVM kernels from the Linode API
kvm_kernels_page_2 = compute.kernels.all(page: 2, filters: { kvm: true }) # Fetch only the 2nd page of KVM kernels
finnix = compute.kernels.get('linode/finnix-legacy') # Load details for a single kernel

dns = Fog::DNS.new(provider: :linode, linode_token: '<your LinodeAPIv4 access token>')
all_domains = dns.domains.all # Load all Linode Domains on your account
exsiting_domain = dns.domains.get(1234567890) # Load details for a single Linode Domain on your account

new_domain = dns.domains.new
new_domain.domain = 'fog-linode.example.com'
new_domain.type = 'master'
new_domain.soa_email = 'fog-linode@example.com'
new_domain.save # Create the new domain
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/Linode/fog-linode. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## Code of Conduct

Everyone interacting in the Fog::Linode project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/Linode/fog-linode/blob/master/CODE_OF_CONDUCT.md).
