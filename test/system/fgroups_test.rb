require "application_system_test_case"

class FgroupsTest < ApplicationSystemTestCase
  setup do
    @fgroup = fgroups(:one)
  end

  test "visiting the index" do
    visit fgroups_url
    assert_selector "h1", text: "Fgroups"
  end

  test "creating a Fgroup" do
    visit fgroups_url
    click_on "New Fgroup"

    fill_in "Name", with: @fgroup.name
    click_on "Create Fgroup"

    assert_text "Fgroup was successfully created"
    click_on "Back"
  end

  test "updating a Fgroup" do
    visit fgroups_url
    click_on "Edit", match: :first

    fill_in "Name", with: @fgroup.name
    click_on "Update Fgroup"

    assert_text "Fgroup was successfully updated"
    click_on "Back"
  end

  test "destroying a Fgroup" do
    visit fgroups_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Fgroup was successfully destroyed"
  end
end
