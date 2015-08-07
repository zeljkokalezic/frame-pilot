require 'test_helper'

class SlackPilotControllerTest < ActionController::TestCase
  test "should get embed" do
    get :embed
    assert_response :success
  end

  test "should get terminal" do
    get :terminal
    assert_response :success
  end

end
