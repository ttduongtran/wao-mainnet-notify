require "test_helper"

class MonikersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @moniker = monikers(:one)
  end

  test "should get index" do
    get monikers_url
    assert_response :success
  end

  test "should get new" do
    get new_moniker_url
    assert_response :success
  end

  test "should create moniker" do
    assert_difference('Moniker.count') do
      post monikers_url, params: { moniker: { memo: @moniker.memo, name: @moniker.name, status: @moniker.status, uri: @moniker.uri } }
    end

    assert_redirected_to moniker_url(Moniker.last)
  end

  test "should show moniker" do
    get moniker_url(@moniker)
    assert_response :success
  end

  test "should get edit" do
    get edit_moniker_url(@moniker)
    assert_response :success
  end

  test "should update moniker" do
    patch moniker_url(@moniker), params: { moniker: { memo: @moniker.memo, name: @moniker.name, status: @moniker.status, uri: @moniker.uri } }
    assert_redirected_to moniker_url(@moniker)
  end

  test "should destroy moniker" do
    assert_difference('Moniker.count', -1) do
      delete moniker_url(@moniker)
    end

    assert_redirected_to monikers_url
  end
end
