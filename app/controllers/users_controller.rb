class UsersController < ApplicationController

    require 'rest-client'

    def get_images  
        url = "http://shibe.online/api/shibes?count=10" 
        response = RestClient.get(url) 
        render json: response
    end

    def get_stock_market 
        url = "https://www.alphavantage.co/query?function=TIME_SERIES_INTRADAY&symbol=IBM&interval=1min&apikey=demo"
        response = RestClient.get(url) 
        render json: response
    end

    def random
        url="https://randomuser.me/api/"
        response=RestClient.get(url)
        render json: response
    end
end
