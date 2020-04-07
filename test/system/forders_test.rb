require "application_system_test_case"

class FordersTest < ApplicationSystemTestCase
  setup do
    @forder = forders(:one)
  end

  test "visiting the index" do
    visit forders_url
    assert_selector "h1", text: "Forders"
  end

  test "creating a Forder" do
    visit forders_url
    click_on "New Forder"

    fill_in "Image", with: @forder.image
    fill_in "Meal", with: @forder.meal
    fill_in "Resturant", with: @forder.resturant
    click_on "Create Forder"

    assert_text "Forder was successfully created"
    click_on "Back"
  end

  test "updating a Forder" do
    visit forders_url
    click_on "Edit", match: :first

    fill_in "Image", with: @forder.image
    fill_in "Meal", with: @forder.meal
    fill_in "Resturant", with: @forder.resturant
    click_on "Update Forder"

    assert_text "Forder was successfully updated"
    click_on "Back"
  end

  test "destroying a Forder" do
    visit forders_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Forder was successfully destroyed"
  end
end
