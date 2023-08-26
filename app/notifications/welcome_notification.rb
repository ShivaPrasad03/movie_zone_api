# To deliver this notification:
#
# MovieRecommendation.with(post: @post).deliver_later(current_user)
# MovieRecommendation.with(post: @post).deliver(current_user)

class WelcomeNotification< Noticed::Base
  # Add your delivery methods
  #
  # deliver_by :database
  deliver_by :email, mailer: 'MovieMailer'
  # deliver_by :slack
  # deliver_by :custom, class: "MyDeliveryMethod"

  # Add required params
  #
  param :email
  param :name 
  # param :og
 

  # Define helper methods to make rendering easier.
  #
  def movie
    
  end
  
  # def url
  #   post_path(params[:movie])
  # end
end
