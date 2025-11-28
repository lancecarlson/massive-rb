# frozen_string_literal: true

lib = File.expand_path("lib", __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "massiveclient/version"

Gem::Specification.new do |spec|
  spec.name          = "massiveclient"
  spec.version       = MassiveClient::VERSION
  spec.authors       = ["Lance Carlson"]
  spec.email         = ["lancecarlson@gmail.com"]

  spec.license       = "MIT"

  spec.summary       = "Client library for Massive.com (formerly Polygon.io). Massive is an API for real-time and historical market data."
  spec.description   = "Client library for Massive.com's REST and Websocket API's. Massive (formerly Polygon.io) is an API for real-time and historical market data for stocks, crypto, and forex."

  spec.metadata = {
    "homepage_uri" => "https://github.com/lancecarlson/massive-rb",
    "source_code_uri" => "https://github.com/lancecarlson/massive-rb",
    "bug_tracker_uri" => "https://github.com/lancecarlson/massive-rb/issues"
  }

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "activesupport", ">= 7.0"
  spec.add_runtime_dependency "dry-struct", ">= 1.2"
  spec.add_runtime_dependency "dry-types", ">= 1.2"
  spec.add_runtime_dependency "eventmachine", ">= 1.2"
  spec.add_runtime_dependency "faraday", ">= 2.0"
  spec.add_runtime_dependency "faraday-retry", ">= 2.0"
  spec.add_runtime_dependency "oj", ">= 3.10"
  spec.add_runtime_dependency "permessage_deflate", ">= 0.1"
  spec.add_runtime_dependency "websocket-driver", ">= 0.7"

  spec.add_development_dependency "bundler", ">= 2.3"
  spec.add_development_dependency "dotenv", ">= 2.7"
  spec.add_development_dependency "faker", ">= 2.11"
  spec.add_development_dependency "minitest", ">= 5.0"
  spec.add_development_dependency "rake", ">= 13.0"
  spec.add_development_dependency "rubocop", ">= 1.50"
  spec.add_development_dependency "rubocop-performance", ">= 1.11"
  spec.add_development_dependency "vcr", ">= 5.1"
end
