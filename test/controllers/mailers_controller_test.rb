require 'test_helper'

class MailersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get mailers_index_url
    assert_response :success
  end

end
