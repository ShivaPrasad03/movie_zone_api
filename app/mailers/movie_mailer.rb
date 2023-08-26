class MovieMailer < ApplicationMailer
  def welcome_notification
    @name = params[:name]
    @email = params[:email]
    @recipient = params[:recipient]
   

      mail(to: @recipient.email, subject: 'Welcome to MovieZone', 
        body:
         "Hi Movie Lover,
         Thank you for creating an account with us 

         Your Profile Details 

         Email : #{@email}
         Name  : #{@name}
         
         Enjoy the life with watching movies - add unlimited movies to your watchlist and don't miss 
         experience."
        )
    end

end
