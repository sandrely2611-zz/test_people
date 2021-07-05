# frozen_string_literal: true

module ApiSalesloft
  class Request
    def self.call(**args, &block)
      new(**args, &block).call
    end

    def initialize(method:, uri:, body: nil, token: nil)
      @method = method
      @uri = URI uri
      @request = request_class.new(uri).tap do |req|
        req['Accept'] = 'application/json'
        req['Content-Type'] = 'application/json'
        req['Authorization'] = "Bearer #{token}" if token
        req.body = body if body
      end
    end

    def call
      response = Net::HTTP.start(uri.host, uri.port, use_ssl: true) do |http|
        http.request(request)
      end
      Response.new(response)
    end

    private

    attr_reader :request, :method, :uri

    def request_class
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
  end
end
