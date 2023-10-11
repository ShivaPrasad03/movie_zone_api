require 'rails_helper'


RSpec.describe Movie, type: :model do
  context "rspec movie validations" do  
    let(:movie) {Movie.new(movie_name: "OG")}
      it "validate uniqness of movie_name" do 
        Movie.create(movie_name: "OG")
        expect{movie.save!}.to raise_error(ActiveRecord::RecordInvalid)
      end
  end
end
