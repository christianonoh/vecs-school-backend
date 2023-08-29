# rubocop:disable Metrics/BlockLength
require 'swagger_helper'

RSpec.describe 'api/courses', type: :request do
  path '/courses' do
    get 'Retrieve all courses' do
      tags 'Courses'
      security [Bearer: []]
      produces 'application/json'
      parameter name: :Authorization, in: :header, type: :string

      response '200', 'Get courses' do
        schema type: :array,
               items: {
                 type: :object,
                 properties: {
                   id: { type: :integer },
                   name: { type: :string },
                   photo: { type: :string },
                   teacher: { type: :string },
                   description: { type: :string },
                   price: { type: :number, format: :float }
                 },
                 required: %i[id name description photo teacher price]
               }

        run_test! do |_params, _body, _headers|
          expect(response).to have_http_status(:ok)
        end
      end
    end

    post 'Create a course' do
      tags 'Courses'
      security [Bearer: []]
      consumes 'application/json'
      produces 'application/json'
      parameter name: :Authorization, in: :header, type: :string
      parameter name: :course, in: :body, schema: {
        type: :object,
        properties: {
          course: {
            type: :object,
            properties: {
              name: { type: :string },
              description: { type: :string },
              price: { type: :number, format: :float },
              photo: { type: :string },
              teacher: { type: :string }
            },
            required: %i[name description price photo teacher]
          }
        },
        required: [:course]
      }

      response '200', 'Course created' do
        schema type: :object,
               properties: {
                 id: { type: :integer },
                 name: { type: :string },
                 description: { type: :string },
                 price: { type: :number, format: :float },
                 photo: { type: :string },
                 teacher: { type: :string }
               },
               required: %i[id name description price photo teacher]

        let(:course) do
          { course: { name: 'Example Course', description: 'Example description', price: 10.0,
                      photo: 'example.jpg', teacher: 'Example Teacher' } }
        end

        run_test! do |_params, _body, _headers|
          expect(response).to have_http_status(:ok)
        end
      end

      response '401', 'You are not authorized to create a course.' do
        let(:course) do
          { course: { name: 'Example Course', description: 'Example description', price: 10.0,
                      photo: 'example.jpg', teacher: 'Example Teacher' } }
        end

        run_test! do |_params, _body, _headers|
          expect(response).to have_http_status(:unauthorized)
        end
      end

      response '422', 'Unprocessable Entity' do
        let(:course) do
          { course: { name: nil, description: 'Example description', price: 10.0,
                      photo: 'example.jpg', teacher: 'Example Teacher' } }
        end

        run_test! do |_params, _body, _headers|
          expect(response).to have_http_status(:unprocessable_entity)
        end
      end
    end
  end

  path '/courses/{id}' do
    get 'Retrieve a specific course' do
      tags 'Courses'
      security [Bearer: []]
      produces 'application/json'
      parameter name: :id, in: :path, type: :integer
      parameter name: :Authorization, in: :header, type: :string

      response '200', 'Course details' do
        schema type: :object,
               properties: {
                 id: { type: :integer },
                 name: { type: :string },
                 description: { type: :string },
                 price: { type: :number, format: :float },
                 photo: { type: :string },
                 teacher: { type: :string }
               },
               required: %i[id name description price photo teacher]

        let(:id) do
          Course.create(name: 'Example Course', description: 'Example description', price: 10.0,
                        photo: 'example.jpg', teacher: 'Example Teacher').id
        end

        run_test! do |_params, _body, _headers|
          expect(response).to have_http_status(:ok)
        end
      end

      response '404', 'Not Found' do
        let(:id) { 9999 }

        run_test! do |_params, _body, _headers|
          expect(response).to have_http_status(:not_found)
        end
      end
    end

    delete 'Delete a course' do
      tags 'Courses'
      security [Bearer: []]
      produces 'application/json'
      parameter name: :id, in: :path, type: :integer
      parameter name: :Authorization, in: :header, type: :string

      response '200', 'Course deleted' do
        schema type: :object,
               properties: {
                 message: { type: :string }
               },
               required: [:message]

        let(:id) do
          Course.create(name: 'Example Course', description: 'Example description', price: 10.0,
                        photo: 'example.jpg', teacher: 'Example Teacher').id
        end

        run_test! do |_params, _body, _headers|
          expect(response).to have_http_status(:ok)
        end
      end

      response '401', 'You are not authorized to delete a course.' do
        let(:id) do
          Course.create(name: 'Example Course', description: 'Example description', price: 10.0,
                        photo: 'example.jpg', teacher: 'Example Teacher').id
        end

        run_test! do |_params, _body, _headers|
          expect(response).to have_http_status(:unauthorized)
        end
      end

      response '404', 'Not Found' do
        let(:id) { 9999 }

        run_test! do |_params, _body, _headers|
          expect(response).to have_http_status(:not_found)
        end
      end
    end
  end
end
# rubocop:enable Metrics/BlockLength
