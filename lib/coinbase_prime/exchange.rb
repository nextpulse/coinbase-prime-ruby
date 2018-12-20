require "bigdecimal"
require "json"
require "uri"
require "net/http"
require "em-http-request"
require "faye/websocket"

require "coinbase_prime/exchange/errors"
require "coinbase_prime/exchange/api_object"
require "coinbase_prime/exchange/api_response"
require "coinbase_prime/exchange/api_client.rb"
require "coinbase_prime/exchange/adapters/net_http.rb"
require "coinbase_prime/exchange/adapters/em_http.rb"
require "coinbase_prime/exchange/client"
require "coinbase_prime/exchange/websocket"

module CoinbasePrime
  # Coinbase Exchange module
  module Exchange
  end
end
