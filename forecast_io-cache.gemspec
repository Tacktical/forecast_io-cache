# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'forecast_io/cache/version'

Gem::Specification.new do |spec|
  spec.name          = "forecast_io-cache"
  spec.version       = Forecast::IO::Cache::VERSION
  spec.authors       = ["Jon Rowe"]
  spec.email         = ["hello@jonrowe.co.uk"]
  spec.description   = %q{Caching layer for forecast_io}
  spec.summary       = %q{Caching layer for forecast_io}
  spec.homepage      = "https://github.com/Tacktical/forecast_io-cache"
  spec.license       = "MIT"

  spec.files         = `git ls-files lib/** spec/** features/** LICENSE.txt README.md forecast_io-cache.gemspec`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "forecast_io", '~> 1.1.0'
  spec.add_runtime_dependency "sinatra"
  spec.add_runtime_dependency "mongo_adaptor"

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "cucumber"
  spec.add_development_dependency "rack-test"
  spec.add_development_dependency "vcr"

  spec.add_development_dependency "mongo"
  spec.add_development_dependency "bson"
  spec.add_development_dependency "bson_ext"

end
