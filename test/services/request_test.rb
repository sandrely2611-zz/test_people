require 'test_helper'

class ApiSalesLoftRequest < ActiveSupport::TestCase
  test 'request to people endpoint' do
    config = ApiSalesloft::Configuration.new
    request = ApiSalesloft::Request.for(method: :get,
                              uri: "#{config.api_url}/people.json",
                              token: config.auth_token)
    response = request.call
    assert response.content[:data]
    assert_equal "200", response.status_code
  end
end
