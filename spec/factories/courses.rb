FactoryBot.define do
  factory :course do
    name { 'Redux' }
    description { 'description for redux' }
    photo { 'photo.png' }
    price { 100.0 }
    teacher { 'Elijah' }
  end
end
