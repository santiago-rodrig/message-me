require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(name: 'jhon', password: 'secret',
      password_confirmation: 'secret')
  end

  test 'name can not be too long' do
    @user.name = 'a' * 26
    assert @user.invalid?
  end

  test 'name can not be too short' do
    @user.name = 'aa'
    assert @user.invalid?
  end

  test 'name must be unique' do
    user_2 = User.new(name: 'jhon', password: 'hidden',
      password_confirmation: 'hidden')

    @user.save
    assert user_2.invalid?
  end
end
