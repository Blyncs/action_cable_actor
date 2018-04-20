# ActionCableActor

ActionCable SubscriptionAdapter using concurrent_ruby Actors.

### This is only meant for pub/sub usage within the same websocket session.

Fully async broadcast and concurrent receive. 

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'action_cable_actor'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install action_cable_actor

## Usage

specify `actor` as adapter in `cable.yml`

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/patrickbrownsync/action_cable_actor.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
