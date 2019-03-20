require 'test_helper'

class RelationControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get relation_create_url
    assert_response :success
  end

  test "should get destroy" do
    get relation_destroy_url
    assert_response :success
  end

end
