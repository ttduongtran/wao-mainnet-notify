require "application_system_test_case"

class MonikersTest < ApplicationSystemTestCase
  setup do
    @moniker = monikers(:one)
  end

  test "visiting the index" do
    visit monikers_url
    assert_selector "h1", text: "Monikers"
  end

  test "creating a Moniker" do
    visit monikers_url
    click_on "New Moniker"

    fill_in "Memo", with: @moniker.memo
    fill_in "Name", with: @moniker.name
    fill_in "Status", with: @moniker.status
    fill_in "Uri", with: @moniker.uri
    click_on "Create Moniker"

    assert_text "Moniker was successfully created"
    click_on "Back"
  end

  test "updating a Moniker" do
    visit monikers_url
    click_on "Edit", match: :first

    fill_in "Memo", with: @moniker.memo
    fill_in "Name", with: @moniker.name
    fill_in "Status", with: @moniker.status
    fill_in "Uri", with: @moniker.uri
    click_on "Update Moniker"

    assert_text "Moniker was successfully updated"
    click_on "Back"
  end

  test "destroying a Moniker" do
    visit monikers_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Moniker was successfully destroyed"
  end
end
