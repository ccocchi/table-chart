# Table

An implementation of a `Table` class.

The `Table` class represents a table consitued of rows and columns. It is very similar to a `Matrix` but does not implement mathematics function but more atomic functions like adding a column, a row or getting the value of a single cell.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'table-chart'
```

And then execute:

```
$ bundle
```

## Usage

```ruby
t = Table.new([1, 2], [3, 4])
t.row(0) # => [1, 2]
t.(1, 0) # => read the value of the 2nd row and first column, which is 3
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/ccocchi/table-chart. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Table::Chart project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/table-chart/blob/master/CODE_OF_CONDUCT.md).
