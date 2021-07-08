require 'test_helper'

class PeopleControllerTest < ActionDispatch::IntegrationTest
  test 'test_index_success_reponse' do
    get root_path
    assert_response :success
    assert assigns(:people)
  end
end
