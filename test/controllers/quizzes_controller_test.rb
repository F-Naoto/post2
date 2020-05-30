require 'test_helper'

class QuizzesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get quizzes_new_url
    assert_response :success
  end

end
