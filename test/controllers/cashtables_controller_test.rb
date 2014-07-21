require 'test_helper'

class CashtablesControllerTest < ActionController::TestCase
  setup do
    @cashtable = cashtables(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:cashtables)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create cashtable" do
    assert_difference('Cashtable.count') do
      post :create, cashtable: { apr: @cashtable.apr, aug: @cashtable.aug, bdm_id: @cashtable.bdm_id, dec: @cashtable.dec, feb: @cashtable.feb, jan: @cashtable.jan, july: @cashtable.july, jun: @cashtable.jun, lead_id: @cashtable.lead_id, mar: @cashtable.mar, may: @cashtable.may, nov: @cashtable.nov, oct: @cashtable.oct, sept: @cashtable.sept, year: @cashtable.year }
    end

    assert_redirected_to cashtable_path(assigns(:cashtable))
  end

  test "should show cashtable" do
    get :show, id: @cashtable
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @cashtable
    assert_response :success
  end

  test "should update cashtable" do
    patch :update, id: @cashtable, cashtable: { apr: @cashtable.apr, aug: @cashtable.aug, bdm_id: @cashtable.bdm_id, dec: @cashtable.dec, feb: @cashtable.feb, jan: @cashtable.jan, july: @cashtable.july, jun: @cashtable.jun, lead_id: @cashtable.lead_id, mar: @cashtable.mar, may: @cashtable.may, nov: @cashtable.nov, oct: @cashtable.oct, sept: @cashtable.sept, year: @cashtable.year }
    assert_redirected_to cashtable_path(assigns(:cashtable))
  end

  test "should destroy cashtable" do
    assert_difference('Cashtable.count', -1) do
      delete :destroy, id: @cashtable
    end

    assert_redirected_to cashtables_path
  end
end
