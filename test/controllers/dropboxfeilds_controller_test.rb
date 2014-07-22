require 'test_helper'

class DropboxfeildsControllerTest < ActionController::TestCase
  setup do
    @dropboxfeild = dropboxfeilds(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:dropboxfeilds)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create dropboxfeild" do
    assert_difference('Dropboxfeild.count') do
      post :create, dropboxfeild: {  }
    end

    assert_redirected_to dropboxfeild_path(assigns(:dropboxfeild))
  end

  test "should show dropboxfeild" do
    get :show, id: @dropboxfeild
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @dropboxfeild
    assert_response :success
  end

  test "should update dropboxfeild" do
    patch :update, id: @dropboxfeild, dropboxfeild: {  }
    assert_redirected_to dropboxfeild_path(assigns(:dropboxfeild))
  end

  test "should destroy dropboxfeild" do
    assert_difference('Dropboxfeild.count', -1) do
      delete :destroy, id: @dropboxfeild
    end

    assert_redirected_to dropboxfeilds_path
  end
end
