# frozen_string_literal: true

require "test_helper"

class ReferenceTickersTest < Minitest::Test
  def setup
    @client = MassiveClient::Rest::Client.new(api_key) do |builder|
      # builder.response :logger, nil, { headers: true, bodies: true }
    end
  end

  def test_list
    VCR.use_cassette("tickers") do
      res = @client.reference.tickers.list
      assert_equal "OK", res.status
      assert_equal 100, res.results.length
      assert_equal "A", res.results.first.ticker
      assert_equal "Agilent Technologies Inc.", res.results.first.name
    end
  end

  def test_types
    VCR.use_cassette("ticker_types") do
      res = @client.reference.tickers.types
      assert_equal "Common Stock", res.results.types.fetch("CS")
    end
  end

  def test_details
    VCR.use_cassette("ticker_details") do
      res = @client.reference.tickers.details("AAPL")
      assert_equal "Apple Inc.", res.name
    end
  end

  def test_news
    VCR.use_cassette("ticker_news") do
      res = @client.reference.tickers.news("AAPL", 10)
      assert_equal "OK", res.status
      assert res.results.length > 0
    end
  end
end
