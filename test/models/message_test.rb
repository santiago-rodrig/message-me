require 'test_helper'

class MessageTest < ActiveSupport::TestCase
  def setup
    @message = Message.new(body: 'Testing this model')
  end

  test 'message body should not be blank' do
    @message.body = ''
    assert @message.invalid?
  end
end
