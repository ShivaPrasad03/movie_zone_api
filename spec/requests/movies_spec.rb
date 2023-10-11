require 'rails_helper'

RSpec.describe "Movies", type: :request do
  # let!(:user) {User.create(name:"user2", password: "123456", email:"email1")}
  let(:user) {create :user}
  
    before(:each) do 
      sign_in(user)
    end

   context "movies action rspecs" do

    it "should render movies of current user" do
      get "/movies/"
      expect(response).to have_http_status(200)
    end


    it "movie should add to watchlist of current user" do 
      
      post "/movies/" , params: {movie_name:"OG"}
      expect(response).to have_http_status(200)
      expect(response.body).to eq("Movie added successfully to your watchlist")

    end


    it "movie should delete from watchlist of current user" do 

      delete "/movies/" , params: {movie_name:"OG"}
      expect(response).to have_http_status(200)

    end

  end
end
