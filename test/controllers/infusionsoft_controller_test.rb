require 'test_helper'

class InfusionsoftControllerTest < ActionController::TestCase
  test "should get newsale" do
    get :newsale
    assert_response :success
  end

end
