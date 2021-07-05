# frozen_string_literal: true

require 'json'
require 'net/http'
require 'api_salesloft/configuration'
require 'api_salesloft/request'
require 'api_salesloft/response'
require 'api_salesloft/client'
require 'pry'

module ApiSalesloft
  class Error < StandardError; end

  class InvalidRequestError < StandardError; end

  class InvalidResponseError < StandardError; end

  def self.configuration
    @configuration ||= Configuration.new
  end

  def self.configure
    yield(configuration)
  end

  def self.client(token)
    Client.new(auth_token: token)
  end
end
