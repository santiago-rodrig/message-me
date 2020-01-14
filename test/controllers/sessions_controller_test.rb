require 'test_helper'

class SessionsControllerTest < ActionDispatch::IntegrationTest
  test "should get login" do
    get root_url
    assert_response :success
  end

  test 'should login valid user' do
    post root_url, params: { session: { name: 'bob', password: 'secret' } }
    assert_response :redirect
    assert_redirected_to chatroom_url
    follow_redirect!
    assert flash.any?
    assert_equal users(:bob).id, session[:user_id], 'session id does not match'

    assert_equal users(:bob), @controller.current_user,
      'current user is not the same'

    assert @controller.logged_in?
  end

  test 'should not login an invalid user' do
    post root_url, params: { session: { name: 'jen', password: 'whatevs' } }
    assert_select 'form.ui.form'
    assert_select 'input[type="submit"]:match(\'value\', ?)', 'Login'
    assert flash.any?
    assert_nil session[:user_id]
    assert_nil @controller.current_user
    assert_not @controller.logged_in?
  end

  test 'should delete the session of a logged in user' do
    post root_url, params: { session: { name: 'bob', password: 'secret' } }
    follow_redirect!
    delete logout_url
    assert_nil session[:user_id]
    assert_nil @controller.current_user
    assert_not @controller.logged_in?
  end
end
