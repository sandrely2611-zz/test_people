require 'test_helper'

class ApiSalesLoftService < ActiveSupport::TestCase
  test 'ApiSalesloft module' do
    ApiSalesloft
  end

  test 'ApiSalesloft configuration' do
    config = ApiSalesloft.configuration
    assert config.api_url
    assert config.auth_token
  end

  test 'ApiSalesloft rest' do
    client = ApiSalesloft.rest(ApiSalesloft.configuration.auth_token)
    assert client
  end

  test 'ApiSalesloft Request Class' do
    config = ApiSalesloft.configuration
    response = ApiSalesloft::Request.call(method: :get,
                                          uri: "#{config.api_url}/people.json",
                                          token: config.auth_token)
    assert response.content[:data]
    assert_equal "200", response.status_code
  end

  test 'ApiSalesloft Client class' do
    config = ApiSalesloft.configuration
    client = ApiSalesloft.rest(config.auth_token)

    assert client.list_people.content[:data]
    assert_equal "200", client.list_people.status_code
  end
end
