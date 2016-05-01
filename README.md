# Mitier

Simple FFI wrapper for MIT's MITIE library. Currently only wraps named entity
extraction part.

For details on what MITIE is and does visit [it's GitHub page](https://github.com/mit-nlp/MITIE).

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'mitier'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install mitier

## Usage

To use the gem make sure you have MITIE compiled and libmitie shared library placed where it can be found by the system.
Also, you are going to need trained models. Download links can be found on [MITIE GitHub page](https://github.com/mit-nlp/MITIE)

To run named entity recognition:

```ruby
extractor = Mitier::Extractor.new(TRAINED_MODEL_PATH).load
extractor.process_ner SOME_TEXT
```

If you only want to run text tokenizer:

```ruby
tokenizer = Mitier::Tokenizer.new SOME_TEXT
tokenizer.process
```

## Development

To run the specs environment variable `TEST_MODEL_PATH` needs to be set and then run `bundle exec rspec`. Environment variables are loaded with Dotvim so you need to have `.env` file with that variable present. There is `.env.example` in the repo.

You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`.


## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/satek/mitier.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

