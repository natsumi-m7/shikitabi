require 'test_helper'

class WentSpotsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get went_spots_create_url
    assert_response :success
  end

  test "should get destroy" do
    get went_spots_destroy_url
    assert_response :success
  end

end
