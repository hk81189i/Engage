require 'test_helper'

class CustomftypesControllerTest < ActionController::TestCase
  setup do
    @customftype = customftypes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:customftypes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create customftype" do
    assert_difference('Customftype.count') do
      post :create, customftype: {  }
    end

    assert_redirected_to customftype_path(assigns(:customftype))
  end

  test "should show customftype" do
    get :show, id: @customftype
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @customftype
    assert_response :success
  end

  test "should update customftype" do
    patch :update, id: @customftype, customftype: {  }
    assert_redirected_to customftype_path(assigns(:customftype))
  end

  test "should destroy customftype" do
    assert_difference('Customftype.count', -1) do
      delete :destroy, id: @customftype
    end

    assert_redirected_to customftypes_path
  end
end
