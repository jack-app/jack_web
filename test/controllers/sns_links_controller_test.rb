require 'test_helper'

class SnsLinksControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get sns_links_new_url
    assert_response :success
  end

  test "should get edit" do
    get sns_links_edit_url
    assert_response :success
  end

end
