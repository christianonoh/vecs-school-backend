FactoryBot.define do
  factory :user do
    name { 'Burger' }
    email { 'burger@example.com' }
    password { '123456' }
  end
end
