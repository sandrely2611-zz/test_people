# frozen_string_literal: true

module ApiSalesloft
  class Configuration
    attr_accessor :api_url, :auth_token

    def initialize
      @api_url = Rails.application.credentials.api_salesloft[:api_url]
      @auth_token = Rails.application.credentials.api_salesloft[:auth_token]
    end
  end
end

