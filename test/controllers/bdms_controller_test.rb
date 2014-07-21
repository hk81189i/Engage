require 'test_helper'

class BdmsControllerTest < ActionController::TestCase
  setup do
    @bdm = bdms(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:bdms)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create bdm" do
    assert_difference('Bdm.count') do
      post :create, bdm: { email: @bdm.email, name: @bdm.name, phone: @bdm.phone }
    end

    assert_redirected_to bdm_path(assigns(:bdm))
  end

  test "should show bdm" do
    get :show, id: @bdm
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @bdm
    assert_response :success
  end

  test "should update bdm" do
    patch :update, id: @bdm, bdm: { email: @bdm.email, name: @bdm.name, phone: @bdm.phone }
    assert_redirected_to bdm_path(assigns(:bdm))
  end

  test "should destroy bdm" do
    assert_difference('Bdm.count', -1) do
      delete :destroy, id: @bdm
    end

    assert_redirected_to bdms_path
  end
end
