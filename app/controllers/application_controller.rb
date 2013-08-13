class ApplicationController < ActionController::Base
  protect_from_forgery

  rescue_from CanCan::AccessDenied do |exception|

    if user_signed_in?
      session[:return_to] = request.referer || units_url
    else
      session[:return_to] = new_user_session_path
    end
    redirect_to session[:return_to], :alert => exception.message
  end


  def after_sign_in_path_for(resource)
    stored_location_for(resource) || resource.is_a?(User) ? units_url : super
  end

end
