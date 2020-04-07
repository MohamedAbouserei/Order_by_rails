require 'test_helper'

class FgroupsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @fgroup = fgroups(:one)
  end

  test "should get index" do
    get fgroups_url
    assert_response :success
  end

  test "should get new" do
    get new_fgroup_url
    assert_response :success
  end

  test "should create fgroup" do
    assert_difference('Fgroup.count') do
      post fgroups_url, params: { fgroup: { name: @fgroup.name } }
    end

    assert_redirected_to fgroup_url(Fgroup.last)
  end

  test "should show fgroup" do
    get fgroup_url(@fgroup)
    assert_response :success
  end

  test "should get edit" do
    get edit_fgroup_url(@fgroup)
    assert_response :success
  end

  test "should update fgroup" do
    patch fgroup_url(@fgroup), params: { fgroup: { name: @fgroup.name } }
    assert_redirected_to fgroup_url(@fgroup)
  end

  test "should destroy fgroup" do
    assert_difference('Fgroup.count', -1) do
      delete fgroup_url(@fgroup)
    end

    assert_redirected_to fgroups_url
  end
end
