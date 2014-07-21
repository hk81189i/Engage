require 'test_helper'

class OncourseExercisesControllerTest < ActionController::TestCase
  setup do
    @oncourse_exercise = oncourse_exercises(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:oncourse_exercises)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create oncourse_exercise" do
    assert_difference('OncourseExercise.count') do
      post :create, oncourse_exercise: { change_agent: @oncourse_exercise.change_agent, coach_name: @oncourse_exercise.coach_name, futurepacing: @oncourse_exercise.futurepacing, postcondition: @oncourse_exercise.postcondition, prac_name: @oncourse_exercise.prac_name, precondition: @oncourse_exercise.precondition, technique: @oncourse_exercise.technique, test: @oncourse_exercise.test, tti_date: @oncourse_exercise.tti_date }
    end

    assert_redirected_to oncourse_exercise_path(assigns(:oncourse_exercise))
  end

  test "should show oncourse_exercise" do
    get :show, id: @oncourse_exercise
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @oncourse_exercise
    assert_response :success
  end

  test "should update oncourse_exercise" do
    patch :update, id: @oncourse_exercise, oncourse_exercise: { change_agent: @oncourse_exercise.change_agent, coach_name: @oncourse_exercise.coach_name, futurepacing: @oncourse_exercise.futurepacing, postcondition: @oncourse_exercise.postcondition, prac_name: @oncourse_exercise.prac_name, precondition: @oncourse_exercise.precondition, technique: @oncourse_exercise.technique, test: @oncourse_exercise.test, tti_date: @oncourse_exercise.tti_date }
    assert_redirected_to oncourse_exercise_path(assigns(:oncourse_exercise))
  end

  test "should destroy oncourse_exercise" do
    assert_difference('OncourseExercise.count', -1) do
      delete :destroy, id: @oncourse_exercise
    end

    assert_redirected_to oncourse_exercises_path
  end
end
