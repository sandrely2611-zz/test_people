# frozen_string_literal: true

module ApiSalesloft
  class Request
    def self.http_request_class(method)
      case method
      when :get
        Net::HTTP::Get
      when :post
        Net::HTTP::Post
      when :put
        Net::HTTP::Put
      when :patch
        Net::HTTP::Patch
      when :delete
        Net::HTTP::Delete
      else
        raise InvalidRequestError
      end
    end

    def self.for(method:, uri:, body: nil, token: nil)
      new(http_request_class: http_request_class(method), uri: uri, body: body, token: token)
    end

    def initialize(http_request_class:, uri:, body: nil, token: nil)
      @request = http_request_class.new(uri).tap do |req|
        req['Accept']               = 'application/json'
        req['Content-Type']         = 'application/json'
        req['Authorization']        = "Bearer #{token}" if token
        req.body = body if body
      end
      @uri = URI uri
    end

    def call
      response = Net::HTTP.start(uri.host, uri.port, use_ssl: true) do |http|
        http.request(request)
      end
      response
    end

    private

    attr_reader :request, :uri
  end
end
