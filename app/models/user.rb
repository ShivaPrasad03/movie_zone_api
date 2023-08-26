class User < ApplicationRecord
    has_many :notifications, as: :recipient, dependent: :destroy
    has_and_belongs_to_many :movies 
    include Devise::JWT::RevocationStrategies::JTIMatcher
    devise :database_authenticatable, :registerable, :validatable,
           :jwt_authenticatable, jwt_revocation_strategy: self
    def jwt_payload 
      super
    end
end
