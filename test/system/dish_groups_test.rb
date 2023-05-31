require "application_system_test_case"

class DishGroupsTest < ApplicationSystemTestCase
  setup do
    @dish_group = dish_groups(:one)
  end

  test "visiting the index" do
    visit dish_groups_url
    assert_selector "h1", text: "Dish Groups"
  end

  test "creating a Dish group" do
    visit dish_groups_url
    click_on "New Dish Group"

    fill_in "Name", with: @dish_group.name
    click_on "Create Dish group"

    assert_text "Dish group was successfully created"
    click_on "Back"
  end

  test "updating a Dish group" do
    visit dish_groups_url
    click_on "Edit", match: :first

    fill_in "Name", with: @dish_group.name
    click_on "Update Dish group"

    assert_text "Dish group was successfully updated"
    click_on "Back"
  end

  test "destroying a Dish group" do
    visit dish_groups_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Dish group was successfully destroyed"
  end
end
