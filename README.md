[![Gem Version](https://badge.fury.io/rb/mina-secrets.svg)](https://badge.fury.io/rb/mina-secrets)

# Mina::Secrets

This is a mina plugin for [secrets\_cli](https://github.com/infinum/secrets_cli)


## Installation

Add this line to your application's Gemfile:

```ruby
gem 'mina-secrets'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install mina-secrets

## Usage

### Setup

Add

    invoke :'secrets:pull'

to your deploy task after bundle:install

Example:

```ruby
task :deploy => :environment do
  deploy do
    invoke :'git:clone'
    invoke :'deploy:link_shared_paths'
    invoke :'bundle:install'
    invoke :'secrets:pull'

    ...
```

Set secrets environment with `secrets_env` attribute. If `secrets_env` is not set, it will use `rails_env`
Example:

```ruby
task :production do
  set :domain, 'production.com'
  set :deploy_to, '/home/deploy/www/...'
  set :rails_env, 'production'
  set :secrets_env, 'production'
  set :branch, 'master'
end
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/infinum/mina-secrets. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
