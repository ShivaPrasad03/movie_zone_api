class Movie < ApplicationRecord
  has_noticed_notifications
  has_and_belongs_to_many :users
  validates  :movie_name, uniqueness: true, allow_nil: false, allow_blank: false
  
end
