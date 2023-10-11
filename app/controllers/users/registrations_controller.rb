# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  include RackSessionsFix

  respond_to :json

# def create
# @user = User.new(set_params)
# if @user.save
#     render json: {
#       status: {code: 200, message: "Account created succesfully"},
#       data: @user
#     }
# else   
#   render json: @user.errors.full_messages, status: 404
# end
# end

# def update 
#   @user = current_user 
#   if @user.update(set_params)
#     render json: 
#   else   
#     render json: @user.errors, status: 404
#   end
# end




  private



  def respond_with(resource, _opts = {})
    if request.method == "POST" && resource.persisted?
      
      render json: {
        status: {code: 200, message: "Signed up sucessfully."},
        data: resource
      }

      MovieMailer.welcome_email(resource).deliver_now
      
    elsif request.method == "DELETE"
      render json: {
        status: { code: 200, message: "Account deleted successfully."}
      }
    else
      render json: {
        status: {code: 422, message: "#{resource.errors.full_messages.to_sentence}"}
      }, status: :unprocessable_entity
    end
  end

  # def set_params 
  #   params.require(:user).permit(:email, :password, :name)
  # end
end
