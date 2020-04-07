require 'test_helper'

class FordersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @forder = forders(:one)
  end

  test "should get index" do
    get forders_url
    assert_response :success
  end

  test "should get new" do
    get new_forder_url
    assert_response :success
  end

  test "should create forder" do
    assert_difference('Forder.count') do
      post forders_url, params: { forder: { image: @forder.image, meal: @forder.meal, resturant: @forder.resturant } }
    end

    assert_redirected_to forder_url(Forder.last)
  end

  test "should show forder" do
    get forder_url(@forder)
    assert_response :success
  end

  test "should get edit" do
    get edit_forder_url(@forder)
    assert_response :success
  end

  test "should update forder" do
    patch forder_url(@forder), params: { forder: { image: @forder.image, meal: @forder.meal, resturant: @forder.resturant } }
    assert_redirected_to forder_url(@forder)
  end

  test "should destroy forder" do
    assert_difference('Forder.count', -1) do
      delete forder_url(@forder)
    end

    assert_redirected_to forders_url
  end
end
