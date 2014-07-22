require 'test_helper'

class ContactvaluesControllerTest < ActionController::TestCase
  setup do
    @contactvalue = contactvalues(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:contactvalues)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create contactvalue" do
    assert_difference('Contactvalue.count') do
      post :create, contactvalue: {  }
    end

    assert_redirected_to contactvalue_path(assigns(:contactvalue))
  end

  test "should show contactvalue" do
    get :show, id: @contactvalue
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @contactvalue
    assert_response :success
  end

  test "should update contactvalue" do
    patch :update, id: @contactvalue, contactvalue: {  }
    assert_redirected_to contactvalue_path(assigns(:contactvalue))
  end

  test "should destroy contactvalue" do
    assert_difference('Contactvalue.count', -1) do
      delete :destroy, id: @contactvalue
    end

    assert_redirected_to contactvalues_path
  end
end
