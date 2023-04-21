require "test_helper"

# TODO: update paths to have admin_ prefix
class AssetsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @asset = assets(:one)
  end

  test "should get index" do
    get assets_url
    assert_response :success
  end

  test "should get new" do
    get new_asset_url
    assert_response :success
  end

  test "should create asset" do
    assert_difference("Asset.count") do
      post assets_url, params: {asset: {name: @asset.name, owner: @asset.owner, starting_balance: @asset.starting_balance, category: @asset.category}}
    end

    assert_redirected_to admin_asset_url(Asset.last)
  end

  test "should show asset" do
    get asset_url(@asset)
    assert_response :success
  end

  test "should get edit" do
    get edit_asset_url(@asset)
    assert_response :success
  end

  test "should update asset" do
    patch asset_url(@asset), params: {asset: {name: @asset.name, owner: @asset.owner, starting_balance: @asset.starting_balance, category: @asset.category}}
    assert_redirected_to admin_asset_url(@asset)
  end

  test "should destroy asset" do
    assert_difference("Asset.count", -1) do
      delete asset_url(@asset)
    end

    assert_redirected_to admin_assets_url
  end
end
