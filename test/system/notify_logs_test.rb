require "application_system_test_case"

class NotifyLogsTest < ApplicationSystemTestCase
  setup do
    @notify_log = notify_logs(:one)
  end

  test "visiting the index" do
    visit notify_logs_url
    assert_selector "h1", text: "Notify Logs"
  end

  test "creating a Notify log" do
    visit notify_logs_url
    click_on "New Notify Log"

    fill_in "Api", with: @notify_log.api_id
    fill_in "Moniker", with: @notify_log.moniker_id
    fill_in "Name", with: @notify_log.name
    click_on "Create Notify log"

    assert_text "Notify log was successfully created"
    click_on "Back"
  end

  test "updating a Notify log" do
    visit notify_logs_url
    click_on "Edit", match: :first

    fill_in "Api", with: @notify_log.api_id
    fill_in "Moniker", with: @notify_log.moniker_id
    fill_in "Name", with: @notify_log.name
    click_on "Update Notify log"

    assert_text "Notify log was successfully updated"
    click_on "Back"
  end

  test "destroying a Notify log" do
    visit notify_logs_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Notify log was successfully destroyed"
  end
end
