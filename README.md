# Massive (Ruby)

Ruby client library for Massive.com (formerly Polygon.io) - Real-time and historical market data for stocks, crypto, and forex.

## Table of Contents

- [Background](#background)
- [Installation](#installation)
- [Usage](#usage)
- [Ruby Support](#ruby-support)

## Background

This is a client library for Massive.com's market data API. Please see [Massive.com](https://massive.com) for full API documentation.

## Ruby Support

- Ruby 3.4+ supported
- Uses Faraday 2.x for HTTP requests
- ActiveSupport 7.x

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'massiveclient'
```

And then execute:

    $ bundle install


## Usage

**Create an instance of the client:**

All methods follow the documentation found at [Massive.com API Docs](https://massive.com/docs):



```ruby
client = MassiveClient::Rest::Client.new(api_key)

# See tests for a full reference of all of methods
client.reference.tickers.list

client.stocks.list_exchanges

client.forex.historic_ticks

client.crypto.list # list exchanges

MassiveClient::Websocket::Client.new("crypto", api_key).subscribe("XQ.BTC-USD") do |event|
  pp "Incoming message"
  pp event
end
```
