require 'test_helper'

class ClignesControllerTest < ActionController::TestCase
  setup do
    @cligne = clignes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:clignes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create cligne" do
    assert_difference('Cligne.count') do
      post :create, cligne: { date: @cligne.date, status: @cligne.status }
    end

    assert_redirected_to cligne_path(assigns(:cligne))
  end

  test "should show cligne" do
    get :show, id: @cligne
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @cligne
    assert_response :success
  end

  test "should update cligne" do
    patch :update, id: @cligne, cligne: { date: @cligne.date, status: @cligne.status }
    assert_redirected_to cligne_path(assigns(:cligne))
  end

  test "should destroy cligne" do
    assert_difference('Cligne.count', -1) do
      delete :destroy, id: @cligne
    end

    assert_redirected_to clignes_path
  end
end
