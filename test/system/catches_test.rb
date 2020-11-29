require "application_system_test_case"

class CatchesTest < ApplicationSystemTestCase
  setup do
    @catch = catches(:one)
  end

  test "visiting the index" do
    visit catches_url
    assert_selector "h1", text: "Catches"
  end

  test "creating a Catch" do
    visit catches_url
    click_on "New Catch"

    fill_in "Fish", with: @catch.fish_id
    fill_in "User", with: @catch.user_id
    fill_in "Weight", with: @catch.weight
    click_on "Create Catch"

    assert_text "Catch was successfully created"
    click_on "Back"
  end

  test "updating a Catch" do
    visit catches_url
    click_on "Edit", match: :first

    fill_in "Fish", with: @catch.fish_id
    fill_in "User", with: @catch.user_id
    fill_in "Weight", with: @catch.weight
    click_on "Update Catch"

    assert_text "Catch was successfully updated"
    click_on "Back"
  end

  test "destroying a Catch" do
    visit catches_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Catch was successfully destroyed"
  end
end
