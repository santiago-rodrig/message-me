require 'test_helper'

class ChatRoomControllerTest < ActionDispatch::IntegrationTest
  test 'should get root' do
    get root_url
    assert_response :success
  end
end
