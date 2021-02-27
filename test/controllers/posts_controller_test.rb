require 'test_helper'

class PostsControllerTest < ActionDispatch::IntegrationTest
  test "should respond with HTTP code 200 when request goes to GET /posts" do
    get posts_path

    assert_response :success
  end

  test "should respond with redirect when a valid request goes to POST /posts" do
    post posts_path, params: { post: { title: "Lego: The Movie", description: "This is an awesome moive" } }

    assert_equal response.code, "302"
    # assert_response :redirect
  end

  test "should respond with render when an invalid request goes to POST /posts" do
    post posts_path, params: { post: { title: "Lego: The Movie", description: "" } }

    assert_equal(response.code, "200")
    # assert_response :success
  end

  test "should something" do
    byebug
  end
end
