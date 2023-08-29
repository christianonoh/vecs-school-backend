require 'swagger_helper'

RSpec.describe 'api/reservations', type: :request do
  path '/api/reservations' do
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
              price: { type: :number, format: :float }
            },
            required: %i[course_id city date price]
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
               required: %i[id user_id course_id city date price]

        let(:reservation) { { reservation: { course_id: 1, date: '1998-05-23', city: 'Enugu' } } }

        run_test! do |_params, _body, _headers|
          expect(response).to have_http_status(:created)
        end
      end

      response '422', 'Unprocessable Entity' do
        let(:reservation) { { reservation: { course_id: 1, date: nil, city: nil } } }

        run_test! do |_params, _body, _headers|
          expect(response).to have_http_status(:unprocessable_entity)
        end
      end
    end
  end
end
