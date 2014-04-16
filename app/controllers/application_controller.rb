class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  before_action :configure_permitted_parameters, if: :devise_controller?
  protect_from_forgery with: :exception
  layout :layout_by_resource

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:current_password,:email, :password, :password_confirmation, :address, :companyName,:tel) }
    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:current_password,:email, :password, :password_confirmation, :address, :companyName,:tel) }
  end
  def after_sign_in_path_for(resource)
    dashboard_index_path
  end
  def layout_by_resource
    if devise_controller? && resource_name == :mi_user
      if action_name == "edit"
        "dashboard"
      else
        "vitrine"
      end
    else
      "application"
    end
  end
end