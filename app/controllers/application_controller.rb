class ApplicationController < ActionController::API
    include Pundit::Authorization

    before_action :configure_permitted_parameters, if: :devise_controller?

    before_action :set_current_user, if: :user_signed_in?

 

    protected
    def configure_permitted_parameters
     
      devise_parameter_sanitizer.permit(:sign_up, keys: %i[name])
      devise_parameter_sanitizer.permit(:account_update, keys: %i[name])
    end

    private

    def set_current_user
      Current.user = current_user
    end
  
end
