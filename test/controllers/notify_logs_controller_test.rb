require "test_helper"

class NotifyLogsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @notify_log = notify_logs(:one)
  end

  test "should get index" do
    get notify_logs_url
    assert_response :success
  end

  test "should get new" do
    get new_notify_log_url
    assert_response :success
  end

  test "should create notify_log" do
    assert_difference('NotifyLog.count') do
      post notify_logs_url, params: { notify_log: { api_id: @notify_log.api_id, moniker_id: @notify_log.moniker_id, name: @notify_log.name } }
    end

    assert_redirected_to notify_log_url(NotifyLog.last)
  end

  test "should show notify_log" do
    get notify_log_url(@notify_log)
    assert_response :success
  end

  test "should get edit" do
    get edit_notify_log_url(@notify_log)
    assert_response :success
  end

  test "should update notify_log" do
    patch notify_log_url(@notify_log), params: { notify_log: { api_id: @notify_log.api_id, moniker_id: @notify_log.moniker_id, name: @notify_log.name } }
    assert_redirected_to notify_log_url(@notify_log)
  end

  test "should destroy notify_log" do
    assert_difference('NotifyLog.count', -1) do
      delete notify_log_url(@notify_log)
    end

    assert_redirected_to notify_logs_url
  end
end
