class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  # def authenticate_user
  #   if current_user == nil
  #     redirect_to new_user_session_path
  #   end
  # end

  def after_sign_in_path_for(resource)
    user_path(current_user.id)
  end

  def after_sign_up_path_for(resource)
    user_path(current_user.id)
  end

  def after_sign_out_path_for(resource)
    root_path
  end


  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up,keys:[:email])
  end
  

end
