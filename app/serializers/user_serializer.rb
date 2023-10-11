class UserSerializer
  include JSONAPI::Serializer
  attributes :id, :name, :email, :auth_token

  attribute :created_date do |user|
    user.created_at.strftime("%Y-%m-%d")
  end
 

end
