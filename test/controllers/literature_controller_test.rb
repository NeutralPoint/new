require 'test_helper'

class LiteratureControllerTest < ActionController::TestCase
  test "should get read" do
    get :read
    assert_response :success
  end

  test "should get result" do
    get :result
    assert_response :success
  end

end
