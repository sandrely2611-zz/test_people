require 'test_helper'

class ApiSalesLoftService < ActiveSupport::TestCase
  test 'ApiSalesloft module' do
    ApiSalesloft
  end

  test 'ApiSaloft configuration' do
    config = ApiSalesloft::Configuration.new
    assert config.api_url
    assert config.auth_token
  end
end

