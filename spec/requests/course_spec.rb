require 'rails_helper'

RSpec.describe Api::V1::CoursesController, type: :request do
  include Devise::Test::IntegrationHelpers
  before(:each) do
    @user = create(:user) # Assuming you have a user factory
    login_as(@user, scope: :user)
  end

  describe 'GET /api/v1/courses' do
    it 'returns a list of courses' do
      courses = create_list(:course, 3)

      get '/api/v1/courses'

      expect(response).to have_http_status(:ok)
      json_response = JSON.parse(response.body)
      expect(json_response.size).to eq(3)
    end
  end

  describe 'GET /api/v1/courses/:id' do
    it 'returns a single course' do
      course = create(:course)

      get "/api/v1/courses/#{course.id}"

      expect(response).to have_http_status(:ok)
      json_response = JSON.parse(response.body)
      expect(json_response['name']).to eq(course.name)
    end

    it 'returns a not found response for non-existent course' do
      get '/api/v1/courses/999'

      expect(response).to have_http_status(:not_found)
    end
  end

  describe 'POST /api/v1/courses' do
    it 'creates a new course' do
      course_params = { course: { name: 'New Course', description: 'Course description', photo: 'photo.jpg', price: 100, teacher: 'John Doe' } }

      post '/api/v1/courses', params: course_params

      expect(response).to have_http_status(:created)
      json_response = JSON.parse(response.body)
      expect(json_response['name']).to eq(course_params[:course][:name])
    end
  end

  describe 'PATCH /api/v1/courses/:id' do
    it 'updates a course' do
      course = create(:course)
      updated_name = 'Updated Course Name'
      updated_params = { course: { name: updated_name } }

      patch "/api/v1/courses/#{course.id}", params: updated_params

      expect(response).to have_http_status(:ok)
      json_response = JSON.parse(response.body)
      expect(json_response['name']).to eq(updated_name)
    end
  end

  describe 'DELETE /api/v1/courses/:id' do
    it 'deletes a course' do
      course = create(:course)

      delete "/api/v1/courses/#{course.id}"

      expect(response).to have_http_status(:ok)
      json_response = JSON.parse(response.body)
      expect(json_response['message']).to eq('Course deleted')
    end
  end
end
