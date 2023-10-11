require 'rails_helper'



RSpec.describe "Users", type: :request do
#   before(:each) do 
#     user = User.create(name:"user2", password: "123456", email:"email1")
#     sign_in(user)
#  end
  # before(:each) do
  #   VCR.insert_cassette "get_images"
  # end
  describe "GET /users" do
    it "works!" do
      VCR.use_cassette("get_images")do
        get "/images"
        expect(response).to have_http_status(200)
      end
    end

    it "stock!!" do
      VCR.use_cassette("get_stock")do
        get "/stock"
        expect(response).to have_http_status(200)
      end
    end

    it "stock!!" do
      VCR.use_cassette("get_user")do
        get "/randomuser"
        expect(response).to have_http_status(200)
      end
    end
  end

  # after(:each) do
  #   VCR.eject_cassette
  # end

end
