# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  include RackSessionsFix
  
  respond_to :json


def update 
  @user = current_user 
  if @user.update(set_params)
    render json: UserSerializer.new(resource).serializable_hash[:data][:attributes]
  else   
    render json: @user.errors
  end
end


  private

  def set_params 
    params.require(:user).permit(:email, :password, :name)
  end

  def respond_with(resource, _opts = {})
    if request.method == "POST" && resource.persisted?
      WelcomeNotification.with(email: resource.email, name: resource.name).deliver_later(resource)
      render json: {
        status: {code: 200, message: "Signed up sucessfully."},
        data: UserSerializer.new(resource).serializable_hash[:data][:attributes]
      }
      # MovieMailer.welcome_email(resource).deliver_now
      
    elsif request.method == "DELETE"
      render json: {
        status: { code: 200, message: "Account deleted successfully."}
      }
    else
      render json: {
        status: {code: 422, message: "User couldn't be created successfully. #{resource.errors.full_messages.to_sentence}"}
      }, status: :unprocessable_entity
    end
  end

  
end
