# frozen_string_literal: true

module MassiveClient
  module Rest
    module Reference
      class Tickers < PolygonRestHandler
        class Ticker < PolygonResponse
          attribute :ticker, Types::String
          attribute :name, Types::String
          attribute :market, Types::String
          attribute :locale, Types::String
          attribute? :primary_exchange, Types::String
          attribute? :type, Types::String
          attribute :active, Types::Bool
          attribute? :currency_name, Types::String
          attribute? :cik, Types::String
          attribute? :composite_figi, Types::String
          attribute? :share_class_figi, Types::String
          attribute? :last_updated_utc, Types::String
        end

        class TickerResponse < PolygonResponse
          attribute :status, Types::String
          attribute :results, Types::Array.of(Ticker)
          attribute? :next_url, Types::String
          attribute? :count, Types::Integer
        end

        class TickersParameters < Dry::Struct
          attribute? :sort, Types::String
          attribute? :type, Types::String
          attribute? :market, Types::String
          attribute? :locale, Types::String
          attribute? :search, Types::String
          attribute? :perpage, Types::String
          attribute? :page, Types::Integer
          attribute? :active, Types::Bool
        end

        def list(params = {})
          params = TickersParameters[params]
          res = client.request.get("/v3/reference/tickers", params.to_h)
          TickerResponse[res.body]
        end

        class TickerTypesResponse < PolygonResponse
          attribute :status, Types::String
          attribute :results do
            attribute :types, Types::Hash
            attribute :index_types, Types::Hash
          end
        end

        def types
          res = client.request.get("/v2/reference/types")
          TickerTypesResponse[res.body]
        end

        class TickerDetailsResponse < PolygonResponse
          attribute? :logo, Types::String
          attribute :exchange, Types::String
          attribute :exchange_symbol, Types::String
          attribute :name, Types::String
          attribute :symbol, Types::String
          attribute? :listdate, Types::JSON::Date
          attribute? :cik, Types::String
          attribute? :bloomberg, Types::String
          attribute? :figi, Types::String.optional
          attribute? :lie, Types::String
          attribute? :sic, Types::Integer
          attribute? :country, Types::String
          attribute? :industry, Types::String
          attribute? :sector, Types::String
          attribute? :marketcap, Types::Integer
          attribute? :employees, Types::Integer
          attribute? :phone, Types::String
          attribute? :ceo, Types::String
          attribute? :url, Types::String
          attribute? :description, Types::String
          attribute? :similar, Types::Array
          attribute? :tags, Types::Array
          attribute? :hq_address, Types::String
          attribute? :hq_state, Types::String
          attribute? :hq_country, Types::String
          attribute? :active, Types::Bool
          attribute? :updated, Types::String
        end

        def details(symbol)
          symbol = Types::String[symbol]
          res = client.request.get("/v1/meta/symbols/#{symbol}/company")
          TickerDetailsResponse[res.body]
        end

        class NewsResponse < PolygonResponse
          attribute :status, Types::String
          attribute :results, Types::Array do
            attribute? :id, Types::String
            attribute? :publisher do
              attribute? :name, Types::String
              attribute? :homepage_url, Types::String
              attribute? :logo_url, Types::String
              attribute? :favicon_url, Types::String
            end
            attribute :title, Types::String
            attribute? :author, Types::String
            attribute :published_utc, Types::String
            attribute :article_url, Types::String
            attribute :tickers, Types::Array.of(Types::String)
            attribute? :amp_url, Types::String
            attribute? :image_url, Types::String
            attribute? :description, Types::String
            attribute? :keywords, Types::Array.of(Types::String)
            attribute? :insights, Types::Array do
              attribute :ticker, Types::String
              attribute :sentiment, Types::String
              attribute :sentiment_reasoning, Types::String
            end
          end
          attribute? :count, Types::Integer
          attribute? :next_url, Types::String
          attribute? :request_id, Types::String
        end

        def news(ticker, limit = 10)
          ticker = Types::String[ticker]
          limit = Types::Integer[limit]
          opts = { ticker: ticker, limit: limit }

          res = client.request.get("/v2/reference/news", opts)
          NewsResponse[res.body]
        end
      end
    end
  end
end
