require 'test_helper'

class ToolReportsControllerTest < ActionController::TestCase
  setup do
    @tool_report = tool_reports(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tool_reports)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tool_report" do
    assert_difference('ToolReport.count') do
      post :create, tool_report: { age: @tool_report.age, browser_agent: @tool_report.browser_agent, factors: @tool_report.factors }
    end

    assert_redirected_to tool_report_path(assigns(:tool_report))
  end

  test "should show tool_report" do
    get :show, id: @tool_report
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @tool_report
    assert_response :success
  end

  test "should update tool_report" do
    put :update, id: @tool_report, tool_report: { age: @tool_report.age, browser_agent: @tool_report.browser_agent, factors: @tool_report.factors }
    assert_redirected_to tool_report_path(assigns(:tool_report))
  end

  test "should destroy tool_report" do
    assert_difference('ToolReport.count', -1) do
      delete :destroy, id: @tool_report
    end

    assert_redirected_to tool_reports_path
  end
end
