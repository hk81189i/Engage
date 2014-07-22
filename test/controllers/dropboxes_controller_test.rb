require 'test_helper'

class DropboxesControllerTest < ActionController::TestCase
  setup do
    @dropbox = dropboxes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:dropboxes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create dropbox" do
    assert_difference('Dropbox.count') do
      post :create, dropbox: {  }
    end

    assert_redirected_to dropbox_path(assigns(:dropbox))
  end

  test "should show dropbox" do
    get :show, id: @dropbox
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @dropbox
    assert_response :success
  end

  test "should update dropbox" do
    patch :update, id: @dropbox, dropbox: {  }
    assert_redirected_to dropbox_path(assigns(:dropbox))
  end

  test "should destroy dropbox" do
    assert_difference('Dropbox.count', -1) do
      delete :destroy, id: @dropbox
    end

    assert_redirected_to dropboxes_path
  end
end
