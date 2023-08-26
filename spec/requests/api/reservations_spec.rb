require 'swagger_helper'

RSpec.describe 'api/reservations', type: :request do
  path 'api/reservations' do
    get 'Retrieve all reservations' do
      tags 'Reservations'
      security [Bearer: []]
      produces 'application/json'
      parameter name: :Authorization, in: :header, type: :string

      response '200', 'Get reservations' do
        schema type: :array,
        items: {
          type: :object,
          properties: {
            id: { type: :integer },
            user_id: { type: :integer },
            course_id: { type: :integer },
            city: { type: string },
            course: {
              type: :object,
              properties: {
                id: { type: :integer },
                name: { type: :string },
                photo: { type: :string },
                teacher: { type: :string },
                user_id: { type: :integer},
                description: { type: :string },
                price: { type: :number, format: :float}
              }
            }
          }
        }
end
