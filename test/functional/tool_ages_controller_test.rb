require 'test_helper'

class ToolAgesControllerTest < ActionController::TestCase
  setup do
    @tool_age = tool_ages(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tool_ages)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tool_age" do
    assert_difference('ToolAge.count') do
      post :create, tool_age: {  }
    end

    assert_redirected_to tool_age_path(assigns(:tool_age))
  end

  test "should show tool_age" do
    get :show, id: @tool_age
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @tool_age
    assert_response :success
  end

  test "should update tool_age" do
    put :update, id: @tool_age, tool_age: {  }
    assert_redirected_to tool_age_path(assigns(:tool_age))
  end

  test "should destroy tool_age" do
    assert_difference('ToolAge.count', -1) do
      delete :destroy, id: @tool_age
    end

    assert_redirected_to tool_ages_path
  end
end
