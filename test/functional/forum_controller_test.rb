require 'test_helper'

class ForumControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get reply" do
    get :reply
    assert_response :success
  end

  test "should get show" do
    get :show
    assert_response :success
  end

  test "should get post" do
    get :post
    assert_response :success
  end

  test "should get create" do
    get :create
    assert_response :success
  end

end
