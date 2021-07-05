# frozen_string_literal: true

require 'json'
require 'net/http'
require 'api_salesloft/configuration'
require 'api_salesloft/request'
require 'api_salesloft/response'
require 'api_salesloft/client'
require 'pry'

module ApiSalesloft
  class Error < StandardError;
  end

  class InvalidRequestError < StandardError;
  end

  class InvalidResponseError < StandardError;
  end

  def self.configuration
    @configuration ||= Configuration.new
  end

  def self.configure
    yield(configuration)
  end

  def self.rest(token)
    Rest.new(Client.new(auth_token: token || configuration.auth_token))
  end

  #Add Rest class to call it from the ApiSalesloft. This method class allow the client instance to fetch the people list from controller
  class Rest
    def initialize(client)
      @client = client
    end

    def list_people
      client.get(path: '/people.json')
    end

    private

    attr_reader :client
  end
end
