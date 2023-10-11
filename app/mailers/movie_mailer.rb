class MovieMailer < ApplicationMailer
  def welcome_email(user)
   

      mail(to: user.email, subject: 'Welcome to MovieZone', 
        body:
         "Hi Movie Lover,
         Thank you for creating an account with us 

         Your Profile Details 

         Email : #{user.email}
         Name  : #{user.name}
         
         Enjoy the life with watching movies - add unlimited movies to your watchlist and don't miss 
         experience."
        )
    end

end
