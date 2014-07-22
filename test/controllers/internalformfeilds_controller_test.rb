require 'test_helper'

class InternalformfeildsControllerTest < ActionController::TestCase
  setup do
    @internalformfeild = internalformfeilds(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:internalformfeilds)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create internalformfeild" do
    assert_difference('Internalformfeild.count') do
      post :create, internalformfeild: {  }
    end

    assert_redirected_to internalformfeild_path(assigns(:internalformfeild))
  end

  test "should show internalformfeild" do
    get :show, id: @internalformfeild
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @internalformfeild
    assert_response :success
  end

  test "should update internalformfeild" do
    patch :update, id: @internalformfeild, internalformfeild: {  }
    assert_redirected_to internalformfeild_path(assigns(:internalformfeild))
  end

  test "should destroy internalformfeild" do
    assert_difference('Internalformfeild.count', -1) do
      delete :destroy, id: @internalformfeild
    end

    assert_redirected_to internalformfeilds_path
  end
end
