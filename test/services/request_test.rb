require 'test_helper'

class ApiSalesLoftRequest < ActiveSupport::TestCase
  test 'request to people endpoint' do
    config = ApiSalesloft.configuration
    response = ApiSalesloft::Request.call(method: :get,
                              uri: "#{config.api_url}/people.json",
                              token: config.auth_token)
    assert response.content[:data]
    assert_equal "200", response.status_code
  end
end
