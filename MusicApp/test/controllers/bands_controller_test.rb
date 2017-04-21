require 'test_helper'

class BandsControllerTest < ActionDispatch::IntegrationTest
  test "should get resources" do
    get bands_resources_url
    assert_response :success
  end

end
