require 'test_helper'

class DishGroupsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @dish_group = dish_groups(:one)
  end

  test "should get index" do
    get dish_groups_url
    assert_response :success
  end

  test "should get new" do
    get new_dish_group_url
    assert_response :success
  end

  test "should create dish_group" do
    assert_difference('DishGroup.count') do
      post dish_groups_url, params: { dish_group: { name: @dish_group.name } }
    end

    assert_redirected_to dish_group_url(DishGroup.last)
  end

  test "should show dish_group" do
    get dish_group_url(@dish_group)
    assert_response :success
  end

  test "should get edit" do
    get edit_dish_group_url(@dish_group)
    assert_response :success
  end

  test "should update dish_group" do
    patch dish_group_url(@dish_group), params: { dish_group: { name: @dish_group.name } }
    assert_redirected_to dish_group_url(@dish_group)
  end

  test "should destroy dish_group" do
    assert_difference('DishGroup.count', -1) do
      delete dish_group_url(@dish_group)
    end

    assert_redirected_to dish_groups_url
  end
end
