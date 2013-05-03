# Forecast::IO::Cache

A local caching setup for [Forecast.IO](https://developer.forecast.io).

The cache is distance and timeframe sensitive, allowing cached forecasts to
be returned within `radius` of the location requested and `timeframe` of
cached forecast.

Thus you can make repeated calls to locations in a similar area (within
radius) and get a cached forecast. Same with timeframes. This reduces
the calls to the [Forecast.IO](https://developer.forecast.io) API for
app's that are attempting to map weather to other geo data.

When the api is called, additionally all hourly forecasts are sliced up
into the cache individually to help pad the `timeframe` cache.

## Installation

Add this line to your application's Gemfile:

    gem 'forecast_io-cache'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install forecast_io-cache

## Usage

Load the gem and then rackup the service.

    use ForecastIO::Cache

or

    run ForecastIO::Cache

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
