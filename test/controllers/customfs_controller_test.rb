require 'test_helper'

class CustomfsControllerTest < ActionController::TestCase
  setup do
    @customf = customfs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:customfs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create customf" do
    assert_difference('Customf.count') do
      post :create, customf: {  }
    end

    assert_redirected_to customf_path(assigns(:customf))
  end

  test "should show customf" do
    get :show, id: @customf
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @customf
    assert_response :success
  end

  test "should update customf" do
    patch :update, id: @customf, customf: {  }
    assert_redirected_to customf_path(assigns(:customf))
  end

  test "should destroy customf" do
    assert_difference('Customf.count', -1) do
      delete :destroy, id: @customf
    end

    assert_redirected_to customfs_path
  end
end
