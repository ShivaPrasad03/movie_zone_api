class Movie < ApplicationRecord
  has_and_belongs_to_many :users
  validates  :movie_name, uniqueness: true
  validates  :movie_name, presence: true
end
