require 'swagger_helper'

RSpec.describe 'api/sessions', type: :request do
  path '/login' do
    post 'Login' do
      tags 'Login'
      consumes 'application/json'
      produces 'application/json'

      parameter name: :user, in: :body, schema: {
        type: :object,
        properties: {
          user: {
            type: :object,
            properties: {
              email: { type: :string },
              password: { type: :string }
            }
          }
        }
      }

      response '200', 'You are logged in.' do
        let(:user) { { user: { email: 'vitoesi@gmail.com', password: 'password' } } }
        run_test!
      end

      response '401', 'Invalid login credentials.' do
        let(:user) { { user: { email: 'user.vitoesi.com', password: 'password' } } }
        run_test!
      end

      response '404', 'User not found.' do
        let(:user) { { user: { email: 'user.vitoesi.com', password: 'password' } } }
        run_test!
      end
    end
  end

  path '/logout' do
    delete 'Logout' do
      tags 'Logout'
      security [Bearer: []]
      consumes 'application/json'
      produces 'application/json'
      parameter name: :Authorization, in: :header, type: :string

      response '200', 'You are logged out.' do
        let(:user) { { user: { email: 'vitoesi@gmail.com', password: '123456' } } }
        run_test!
      end

      response '401', 'Invalid token.' do
        run_test!
      end
    end
  end
end
