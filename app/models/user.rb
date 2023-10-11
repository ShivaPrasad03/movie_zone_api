class User < ApplicationRecord

    validates :name, presence: true
    has_and_belongs_to_many :movies 
    include Devise::JWT::RevocationStrategies::JTIMatcher
    devise :database_authenticatable, :registerable, :validatable,
           :jwt_authenticatable, jwt_revocation_strategy: self
    def jwt_payload 
      super
    end

    def on_jwt_dispatch(token, payload)
      @auth_token = token
    end
    def auth_token
      @auth_token
    end


end
