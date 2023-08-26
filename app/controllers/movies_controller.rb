class MoviesController < ApplicationController
    before_action :authenticate_user!

    # after_action :notify_user


    def create

        if Movie.find_by(movie_name: params[:movie_name])
            @movie = Movie.find_by(movie_name: params[:movie_name])
            current_user.movies << @movie 
            render json: "Movie added successfully to your watchlist"
        else   
            @movie = Movie.new(movie_name: params[:movie_name])
              current_user.movies << @movie 
            if @movie.save  
                render json: "Movie added successfully to your watchlist"
            else  
                render json: @movie.errors 
            end 
        end

    end 

    def index 
        render json: Movie.pluck("movie_name")
    end


    def destroy 
        if Movie.find_by(movie_name: params[:movie_name])
            movie_d = current_user.movies.find_by(movie_name: params[:movie_name])
            current_user.movies.delete(movie_d) 
            render json: "Movie deleted successfully from your watchlist"
        else   
            render json: "You entered movie is not in your watchlist"
        end
        
    end

    
  
   

   
end
