# frozen_string_literal: true

module ApiSalesloft
  class Client
    def initialize(base_url: nil, auth_token: nil)
      @base_uri = URI.parse(ApiSalesloft.configuration.api_url)
      @auth_token = auth_token || ApiSalesloft.configuration.auth_token
    end

    def get(path:, query: nil)
      request(method: :get, path: path, query: query)
    end

    # def post(path:, body: nil)
    #   request(method: :post, path: path, body: body)
    # end
    #
    # def put(path)
    #   request(method: :put, path: path)
    # end
    #
    # def patch(path)
    #   request(method: :patch, path: path)
    # end
    #
    # def delete(path)
    #   request(method: :delete, path: path)
    # end

    private

    attr_reader :base_uri, :auth_token

    def request(method:, path:, body: nil, query: nil)
      uri_with_path = uri_for(path, query)

      Request.call(method: method, uri: uri_with_path, body: body, token: auth_token)
    end

    def uri_for(path, _query = nil)
      uri = base_uri.dup
      "#{uri}#{path}"
    end
  end
end
