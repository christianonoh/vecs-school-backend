require 'rails_helper'

RSpec.describe Api::V1::ReservationsController, type: :request do
  include Devise::Test::IntegrationHelpers
  before(:each) do
    @user = create(:user)
    @course = create(:course)
    login_as(@user, scope: :user)
  end

  describe 'GET /api/v1/reservations' do
    it 'returns a list of reservations' do
      reservations = []
      3.times do
        reservations << Reservation.create!(
          city: 'Lagos',
          date: Date.today,
          user_id: @user.id,
          course_id: @course.id
        )
      end

      get '/api/v1/reservations'

      expect(response).to have_http_status(:ok)
      json_response = JSON.parse(response.body)
      expect(json_response.size).to eq(3)
    end
  end

  describe 'GET /api/v1/reservations/:id' do
    it 'returns a single reservation' do
      reservation = Reservation.create!(
        city: 'Lagos',
        date: Date.today,
        user_id: @user.id,
        course_id: @course.id
      )

      get "/api/v1/reservations/#{reservation.id}"

      expect(response).to have_http_status(:ok)
      json_response = JSON.parse(response.body)
      expect(json_response['city']).to eq(reservation.city)
      expect(json_response['user_id']).to eq(reservation.user_id)
      expect(json_response['course_id']).to eq(reservation.course_id)
    end

    it 'returns a not found response for non-existent reservation' do
      get '/api/v1/reservations/999'

      expect(response).to have_http_status(:not_found)
    end
  end

  describe 'POST /api/v1/reservations' do
    it 'creates a new reservation' do
      reservation_params = { reservation: {
        city: 'Lagos',
        date: Date.today,
        user_id: @user.id,
        course_id: @course.id
      } }

      post '/api/v1/reservations', params: reservation_params

      expect(response).to have_http_status(:created)
      json_response = JSON.parse(response.body)
      expect(json_response['city']).to eq(reservation_params[:reservation][:city])
    end
  end

  describe 'PATCH /api/v1/reservations/:id' do
    it 'updates a reservation' do
      reservation = Reservation.create!(
        city: 'Lagos',
        date: Date.today,
        user_id: @user.id,
        course_id: @course.id
      )
      updated_city = 'Abuja'
      updated_params = { reservation: { city: updated_city } }

      patch "/api/v1/reservations/#{reservation.id}", params: updated_params

      expect(response).to have_http_status(:ok)
      json_response = JSON.parse(response.body)
      expect(json_response['city']).to eq(updated_city)
    end
  end

  describe 'DELETE /api/v1/reservations/:id' do
    it 'deletes a reservation' do
      reservation = Reservation.create!(
        city: 'Lagos',
        date: Date.today,
        user_id: @user.id,
        course_id: @course.id
      )

      delete "/api/v1/reservations/#{reservation.id}"

      expect(response).to have_http_status(:ok)
      json_response = JSON.parse(response.body)
      expect(json_response['message']).to eq('Reservation deleted')
    end
  end
end
