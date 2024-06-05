class ApplicationController < ActionController::Base
  # before_action :authenticate_user!, except: [:index]
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name])
  end

  # def authenticate_user!
  #   unless user_signed_in?
  #     flash[:alert] = "You are not authorized to see this page"
  #     redirect_to new_user_session_path
  #   end
  # end
end
