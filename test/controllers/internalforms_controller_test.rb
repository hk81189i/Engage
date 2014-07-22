require 'test_helper'

class InternalformsControllerTest < ActionController::TestCase
  setup do
    @internalform = internalforms(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:internalforms)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create internalform" do
    assert_difference('Internalform.count') do
      post :create, internalform: {  }
    end

    assert_redirected_to internalform_path(assigns(:internalform))
  end

  test "should show internalform" do
    get :show, id: @internalform
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @internalform
    assert_response :success
  end

  test "should update internalform" do
    patch :update, id: @internalform, internalform: {  }
    assert_redirected_to internalform_path(assigns(:internalform))
  end

  test "should destroy internalform" do
    assert_difference('Internalform.count', -1) do
      delete :destroy, id: @internalform
    end

    assert_redirected_to internalforms_path
  end
end
