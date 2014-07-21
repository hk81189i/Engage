require 'test_helper'

class LeadStatusesControllerTest < ActionController::TestCase
  setup do
    @lead_status = lead_statuses(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:lead_statuses)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create lead_status" do
    assert_difference('LeadStatus.count') do
      post :create, lead_status: { name: @lead_status.name }
    end

    assert_redirected_to lead_status_path(assigns(:lead_status))
  end

  test "should show lead_status" do
    get :show, id: @lead_status
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @lead_status
    assert_response :success
  end

  test "should update lead_status" do
    patch :update, id: @lead_status, lead_status: { name: @lead_status.name }
    assert_redirected_to lead_status_path(assigns(:lead_status))
  end

  test "should destroy lead_status" do
    assert_difference('LeadStatus.count', -1) do
      delete :destroy, id: @lead_status
    end

    assert_redirected_to lead_statuses_path
  end
end
