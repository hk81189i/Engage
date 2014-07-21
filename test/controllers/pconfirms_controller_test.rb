require 'test_helper'

class PconfirmsControllerTest < ActionController::TestCase
  setup do
    @pconfirm = pconfirms(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:pconfirms)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create pconfirm" do
    assert_difference('Pconfirm.count') do
      post :create, pconfirm: { email: @pconfirm.email, name: @pconfirm.name, phone: @pconfirm.phone }
    end

    assert_redirected_to pconfirm_path(assigns(:pconfirm))
  end

  test "should show pconfirm" do
    get :show, id: @pconfirm
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @pconfirm
    assert_response :success
  end

  test "should update pconfirm" do
    patch :update, id: @pconfirm, pconfirm: { email: @pconfirm.email, name: @pconfirm.name, phone: @pconfirm.phone }
    assert_redirected_to pconfirm_path(assigns(:pconfirm))
  end

  test "should destroy pconfirm" do
    assert_difference('Pconfirm.count', -1) do
      delete :destroy, id: @pconfirm
    end

    assert_redirected_to pconfirms_path
  end
end
