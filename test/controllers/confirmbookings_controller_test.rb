require 'test_helper'

class ConfirmbookingsControllerTest < ActionController::TestCase
  setup do
    @confirmbooking = confirmbookings(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:confirmbookings)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create confirmbooking" do
    assert_difference('Confirmbooking.count') do
      post :create, confirmbooking: {  }
    end

    assert_redirected_to confirmbooking_path(assigns(:confirmbooking))
  end

  test "should show confirmbooking" do
    get :show, id: @confirmbooking
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @confirmbooking
    assert_response :success
  end

  test "should update confirmbooking" do
    patch :update, id: @confirmbooking, confirmbooking: {  }
    assert_redirected_to confirmbooking_path(assigns(:confirmbooking))
  end

  test "should destroy confirmbooking" do
    assert_difference('Confirmbooking.count', -1) do
      delete :destroy, id: @confirmbooking
    end

    assert_redirected_to confirmbookings_path
  end
end
