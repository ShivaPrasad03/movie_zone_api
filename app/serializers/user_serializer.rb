class UserSerializer
  include JSONAPI::Serializer
  attributes :id, :name, :email, :jti
  attribute :created_date do |user|
    user.created_at.strftime("%Y-%m-%d")
  end
 

end
