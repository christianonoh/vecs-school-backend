require "test_helper"

class Api::V1::CoursesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @api_v1_course = api_v1_courses(:one)
  end

  test "should get index" do
    get api_v1_courses_url, as: :json
    assert_response :success
  end

  test "should create api_v1_course" do
    assert_difference("Api::V1::Course.count") do
      post api_v1_courses_url, params: { api_v1_course: {  } }, as: :json
    end

    assert_response :created
  end

  test "should show api_v1_course" do
    get api_v1_course_url(@api_v1_course), as: :json
    assert_response :success
  end

  test "should update api_v1_course" do
    patch api_v1_course_url(@api_v1_course), params: { api_v1_course: {  } }, as: :json
    assert_response :success
  end

  test "should destroy api_v1_course" do
    assert_difference("Api::V1::Course.count", -1) do
      delete api_v1_course_url(@api_v1_course), as: :json
    end

    assert_response :no_content
  end
end
