require 'test_helper'

class BlinksControllerTest < ActionController::TestCase
  setup do
    @blink = blinks(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:blinks)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create blink" do
    assert_difference('Blink.count') do
      post :create, blink: { data: @blink.data, status: @blink.status }
    end

    assert_redirected_to blink_path(assigns(:blink))
  end

  test "should show blink" do
    get :show, id: @blink
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @blink
    assert_response :success
  end

  test "should update blink" do
    patch :update, id: @blink, blink: { data: @blink.data, status: @blink.status }
    assert_redirected_to blink_path(assigns(:blink))
  end

  test "should destroy blink" do
    assert_difference('Blink.count', -1) do
      delete :destroy, id: @blink
    end

    assert_redirected_to blinks_path
  end
end
