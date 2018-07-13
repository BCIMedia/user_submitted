# UserSubmitted
Short description and motivation.

## Usage

## Installation

```ruby
gem 'user_submitted'
```

And then execute:
```bash
$ bundle
```
Add all the Gem migration files with:
  bundle exec rake user_submitted_engine:install:migrations

Or install it yourself as:
```bash
$ gem install user_submitted
```

# Assets
Make sure to precompile:
`Rails.application.config.assets.precompile += %w(user_submitted/dropzone.js user_submitted/dropzone.scss user_submitted/admin.scss)`

## Contributing

## License
The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
