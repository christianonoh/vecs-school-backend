# rubocop:disable Metrics/BlockLength
require 'swagger_helper'

RSpec.describe 'api/registrations', type: :request do
  path '/signup' do
    post 'Sign up' do
      tags 'Sign up'
      consumes 'application/json'
      produces 'application/json'

      parameter name: :user, in: :body, schema: {
        type: :object,
        properties: {
          user: {
            type: :object,
            properties: {
              name: { type: :string },
              email: { type: :string },
              password: { type: :string },
            }
          }
        }
      }

      response '200', 'Signed up successfully.' do
        schema type: :object,
               properties: {
                 id: { type: :integer },
                 email: { type: :string },
                 name: { type: :string }
               },
               required: %i[id email name]

        let(:user) do
          {
            user: {
              name: 'Elijah',
              email: 'vitoesi@gmail.com',
              password: '123456'
            }
          }
        end

        run_test! do |_params, _body, _headers|
          expect(response).to have_http_status(:ok)
        end
      end

      response '422', 'Something went wrong' do
        run_test!
      end
    end
  end
end
# rubocop:enable Metrics/BlockLength
