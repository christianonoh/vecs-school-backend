require 'test_helper'

class Api::V1::ReservationsControllerTest < ActionDispatch::IntegrationTest
  test 'should create reservation' do
    assert_difference('Reservation.count') do
      post api_v1_reservations_url, params: {
        reservation: {
          name: 'John Doe',
          email: 'john@example.com',
          date: '2023-08-17T12:00:00Z'
        }
      }, as: :json
    end

    assert_response :created
  end
end
