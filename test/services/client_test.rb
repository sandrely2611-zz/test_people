require 'test_helper'

class ApiSalesLoftClient < ActiveSupport::TestCase
  test 'ApiSalesloft client class' do
    config = ApiSalesloft.configuration
    response = ApiSalesloft.client(config.auth_token).get(path: "/people.json")
    assert response.content[:data]
    assert_equal "200", response.status_code
  end
end
