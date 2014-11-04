class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :name
    devise_parameter_sanitizer.for(:account_update) << :name
  end

  protect_from_forgery with: :exception
 
  def after_sign_in_path_for(source)
    if (current_user.house_key == nil)
      return request.env['omniauth.origin'] || stored_location_for(resource) || houses_path
      else
        return request.env['omniauth.origin'] || house_path(current_user['house_key'])
    end
  end 
  
  def after_sign_up_path_for(source)
    redirect houses_path
  end

end
