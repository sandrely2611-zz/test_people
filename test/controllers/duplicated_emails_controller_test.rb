require 'test_helper'

class DuplicatedEmailsControllerTest < ActionDispatch::IntegrationTest
  test 'test_index_success_response' do
    get duplicated_emails_path
    assert_response :success
    assert assigns(:list)
  end
end
