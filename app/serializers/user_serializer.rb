class UserSerializer
  include JSONAPI::Serializer
  attributes :id, :name, :email
end
