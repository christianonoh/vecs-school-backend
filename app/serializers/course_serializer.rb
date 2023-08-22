class CourseSerializer
  include JSONAPI::Serializer

  attributes :name, :description, :photo, :price, :teacher
end
