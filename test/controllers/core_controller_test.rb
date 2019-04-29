require 'test_helper'

class CoreControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get core_index_url
    assert_response :success
  end

end
