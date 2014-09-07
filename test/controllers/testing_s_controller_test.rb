require 'test_helper'

class TestingSControllerTest < ActionController::TestCase
  setup do
    @testing_ = testing_s(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:testing_s)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create testing_" do
    assert_difference('Testing.count') do
      post :create, testing_: {  }
    end

    assert_redirected_to testing__path(assigns(:testing_))
  end

  test "should show testing_" do
    get :show, id: @testing_
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @testing_
    assert_response :success
  end

  test "should update testing_" do
    patch :update, id: @testing_, testing_: {  }
    assert_redirected_to testing__path(assigns(:testing_))
  end

  test "should destroy testing_" do
    assert_difference('Testing.count', -1) do
      delete :destroy, id: @testing_
    end

    assert_redirected_to testing_s_path
  end
end
