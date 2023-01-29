class ApplicationController < ActionController::Base
  before_action :redirect_to_username_form
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    dashboard_path
  end

  protected

  def redirect_to_username_form
    return if controller_name == "usernames"
    return unless user_signed_in? && current_user.username.blank?
    redirect_to new_username_path
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_in, keys: [:username])
  end
end
