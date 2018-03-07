require 'test_helper'

class ProductLinksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @product_link = product_links(:one)
  end

  test "should get index" do
    get product_links_url
    assert_response :success
  end

  test "should get new" do
    get new_product_link_url
    assert_response :success
  end

  test "should create product_link" do
    assert_difference('ProductLink.count') do
      post product_links_url, params: { product_link: { name: @product_link.name, url: @product_link.url } }
    end

    assert_redirected_to product_link_url(ProductLink.last)
  end

  test "should show product_link" do
    get product_link_url(@product_link)
    assert_response :success
  end

  test "should get edit" do
    get edit_product_link_url(@product_link)
    assert_response :success
  end

  test "should update product_link" do
    patch product_link_url(@product_link), params: { product_link: { name: @product_link.name, url: @product_link.url } }
    assert_redirected_to product_link_url(@product_link)
  end

  test "should destroy product_link" do
    assert_difference('ProductLink.count', -1) do
      delete product_link_url(@product_link)
    end

    assert_redirected_to product_links_url
  end
end
