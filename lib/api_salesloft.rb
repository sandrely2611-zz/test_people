# frozen_string_literal: true

# require 'salesloft/version'
# require 'net/http'
# require 'json'
require 'api_salesloft/configuration'
require 'api_salesloft/client'
require 'api_salesloft/request'
require 'api_salesloft/response'
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
end
