require 'test_helper'

class CharactersControllerTest < ActionDispatch::IntegrationTest
  test 'test_index_success_reponse' do
    get characters_path
    assert_response :success
    assert assigns(:list)
  end
end
