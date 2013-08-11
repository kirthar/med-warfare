require 'test_helper'

class CombatsControllerTest < ActionController::TestCase
  setup do
    @combat = combats(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:combats)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create combat" do
    assert_difference('Combat.count') do
      post :create, combat: {  }
    end

    assert_redirected_to combat_path(assigns(:combat))
  end

  test "should show combat" do
    get :show, id: @combat
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @combat
    assert_response :success
  end

  test "should update combat" do
    put :update, id: @combat, combat: {  }
    assert_redirected_to combat_path(assigns(:combat))
  end

  test "should destroy combat" do
    assert_difference('Combat.count', -1) do
      delete :destroy, id: @combat
    end

    assert_redirected_to combats_path
  end
end
