require 'test_helper'

class ValueItemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @value_item = value_items(:one)
  end

  test "should get index" do
    get value_items_url
    assert_response :success
  end

  test "should get new" do
    get new_value_item_url
    assert_response :success
  end

  test "should create value_item" do
    assert_difference('ValueItem.count') do
      post value_items_url, params: { value_item: { category: @value_item.category, position: @value_item.position, value: @value_item.value } }
    end

    assert_redirected_to value_item_url(ValueItem.last)
  end

  test "should show value_item" do
    get value_item_url(@value_item)
    assert_response :success
  end

  test "should get edit" do
    get edit_value_item_url(@value_item)
    assert_response :success
  end

  test "should update value_item" do
    patch value_item_url(@value_item), params: { value_item: { category: @value_item.category, position: @value_item.position, value: @value_item.value } }
    assert_redirected_to value_item_url(@value_item)
  end

  test "should destroy value_item" do
    assert_difference('ValueItem.count', -1) do
      delete value_item_url(@value_item)
    end

    assert_redirected_to value_items_url
  end
end
