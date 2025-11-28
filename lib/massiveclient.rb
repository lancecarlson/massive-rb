# frozen_string_literal: true

require "massiveclient/version"

require "eventmachine"
require "faraday"
require "faraday/retry"
require "dry-struct"
require "dry-types"
require "permessage_deflate"
require "websocket/driver"

require "massiveclient/types"
require "massiveclient/rest"
require "massiveclient/websocket"
