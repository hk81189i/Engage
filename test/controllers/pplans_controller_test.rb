require 'test_helper'

class PplansControllerTest < ActionController::TestCase
  setup do
    @pplan = pplans(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:pplans)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create pplan" do
    assert_difference('Pplan.count') do
      post :create, pplan: { amount: @pplan.amount, paying_date: @pplan.paying_date, sale_id: @pplan.sale_id, user_id: @pplan.user_id }
    end

    assert_redirected_to pplan_path(assigns(:pplan))
  end

  test "should show pplan" do
    get :show, id: @pplan
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @pplan
    assert_response :success
  end

  test "should update pplan" do
    patch :update, id: @pplan, pplan: { amount: @pplan.amount, paying_date: @pplan.paying_date, sale_id: @pplan.sale_id, user_id: @pplan.user_id }
    assert_redirected_to pplan_path(assigns(:pplan))
  end

  test "should destroy pplan" do
    assert_difference('Pplan.count', -1) do
      delete :destroy, id: @pplan
    end

    assert_redirected_to pplans_path
  end
end
