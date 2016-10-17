require 'test_helper'

class ValueListsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @value_list = value_lists(:one)
  end

  test "should get index" do
    get value_lists_url
    assert_response :success
  end

  test "should get new" do
    get new_value_list_url
    assert_response :success
  end

  test "should create value_list" do
    assert_difference('ValueList.count') do
      post value_lists_url, params: { value_list: { name: @value_list.name, value_items: @value_list.value_items } }
    end

    assert_redirected_to value_list_url(ValueList.last)
  end

  test "should show value_list" do
    get value_list_url(@value_list)
    assert_response :success
  end

  test "should get edit" do
    get edit_value_list_url(@value_list)
    assert_response :success
  end

  test "should update value_list" do
    patch value_list_url(@value_list), params: { value_list: { name: @value_list.name, value_items: @value_list.value_items } }
    assert_redirected_to value_list_url(@value_list)
  end

  test "should destroy value_list" do
    assert_difference('ValueList.count', -1) do
      delete value_list_url(@value_list)
    end

    assert_redirected_to value_lists_url
  end
end
