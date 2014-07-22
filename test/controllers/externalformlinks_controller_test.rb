require 'test_helper'

class ExternalformlinksControllerTest < ActionController::TestCase
  setup do
    @externalformlink = externalformlinks(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:externalformlinks)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create externalformlink" do
    assert_difference('Externalformlink.count') do
      post :create, externalformlink: {  }
    end

    assert_redirected_to externalformlink_path(assigns(:externalformlink))
  end

  test "should show externalformlink" do
    get :show, id: @externalformlink
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @externalformlink
    assert_response :success
  end

  test "should update externalformlink" do
    patch :update, id: @externalformlink, externalformlink: {  }
    assert_redirected_to externalformlink_path(assigns(:externalformlink))
  end

  test "should destroy externalformlink" do
    assert_difference('Externalformlink.count', -1) do
      delete :destroy, id: @externalformlink
    end

    assert_redirected_to externalformlinks_path
  end
end
