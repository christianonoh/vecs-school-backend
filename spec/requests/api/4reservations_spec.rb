require 'swagger_helper'

RSpec.describe 'api/v1/reservations', type: :request do
  # rubocop:disable Metrics/BlockLength
  path '/api/v1/reservations' do
    post 'Create a reservation' do
      tags 'Reservations'
      security [Bearer: []]
      consumes 'application/json'
      produces 'application/json'
      parameter name: :Authorization, in: :header, type: :string
      parameter name: :reservation, in: :body, schema: {
        type: :object,
        properties: {
          reservation: {
            type: :object,
            properties: {
              course_id: { type: :integer },
              date: { type: :string },
              city: { type: :string },
              user_id: { type: :integer }
            },
            required: %i[course_id date city user_id]
          }
        },
        required: [:reservation]
      }

      response '201', 'Reservation created' do
        schema type: :object,
               properties: {
                 id: { type: :integer },
                 user_id: { type: :integer },
                 course_id: { type: :integer },
                 city: { type: :string },
                 date: { type: :integer },
                 course: {
                   type: :object,
                   properties: {
                     id: { type: :integer },
                     name: { type: :string },
                     photo: { type: :string },
                     teacher: { type: :string },
                     user_id: { type: :integer },
                     description: { type: :string },
                     price: { type: :number, format: :float }
                   },
                   required: %i[id name]
                 }
               },
               required: %i[id user_id course_id city date]

        let(:reservation) { { reservation: { course_id: 1, date: '1998-05-23', city: 'Enugu', user_id: 123 } } }

        run_test! do |_params, _body, _headers|
          expect(response).to have_http_status(:created)
        end
      end

      response '422', 'Unprocessable Entity' do
        let(:reservation) { { reservation: { course_id: 1, date: nil, city: nil, user_id: nil } } }

        run_test! do |_params, _body, _headers|
          expect(response).to have_http_status(:unprocessable_entity)
        end
      end
    end
  end

  path '/api/v1/reservations' do
    get 'List reservations' do
      tags 'Reservations'
      security [Bearer: []]
      consumes 'application/json'
      produces 'application/json'
      parameter name: :Authorization, in: :header, type: :string

      response '200', 'List of reservations' do
        schema type: :array,
               items: {
                 type: :object,
                 properties: {
                   id: { type: :integer },
                   user_id: { type: :integer },
                   course_id: { type: :integer },
                   city: { type: :string },
                   date: { type: :integer },
                   course: {
                     type: :object,
                     properties: {
                       id: { type: :integer },
                       name: { type: :string },
                       photo: { type: :string },
                       teacher: { type: :string },
                       user_id: { type: :integer },
                       description: { type: :string },
                       price: { type: :number, format: :float }
                     },
                     required: %i[id name]
                   }
                 },
                 required: %i[id user_id course_id city date]
               }

        run_test! do |_params, _body, _headers|
          expect(response).to have_http_status(:ok)
        end
      end
    end
  end
  # rubocop:enable Metrics/BlockLength
end
