class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_filter :configure_permitted_parameters, if: :devise_controller?

  private

  def configure_permitted_parameters

    devise_parameter_sanitizer.permit(:sign_up, keys: [:username]) # Синтакс в rails5 немного отличается 
    devise_parameter_sanitizer.permit(:sign_in) { |u| u.permit(:login, :username, :email, :password, :remember_me) }
    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:username, :email, :password, :password_confirmation, :current_password) }

  end 

end
