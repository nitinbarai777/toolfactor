require 'test_helper'

class ToolFactorsControllerTest < ActionController::TestCase
  setup do
    @tool_factor = tool_factors(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tool_factors)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tool_factor" do
    assert_difference('ToolFactor.count') do
      post :create, tool_factor: {  }
    end

    assert_redirected_to tool_factor_path(assigns(:tool_factor))
  end

  test "should show tool_factor" do
    get :show, id: @tool_factor
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @tool_factor
    assert_response :success
  end

  test "should update tool_factor" do
    put :update, id: @tool_factor, tool_factor: {  }
    assert_redirected_to tool_factor_path(assigns(:tool_factor))
  end

  test "should destroy tool_factor" do
    assert_difference('ToolFactor.count', -1) do
      delete :destroy, id: @tool_factor
    end

    assert_redirected_to tool_factors_path
  end
end
