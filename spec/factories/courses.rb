FactoryBot.define do
  factory :course do
    name { 'Example Course' }
    description { 'This is a course description.' }
    photo { 'course.jpg' }
    price { 50 }
    teacher { 'John Doe' }
  end
end
