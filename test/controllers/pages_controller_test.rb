require "test_helper"

class PagesControllerTest < ActionDispatch::IntegrationTest
  test "should get blog_app" do
    get pages_blog_app_url
    assert_response :success
  end
end
