class ApplicationController < ActionController::Base
  protect_from_forgery
  require 'pp'
  def authenticated?
    return false if session[:user_id].nil? or session[:user_created_at].nil? or current_user.nil?
    return true
  end
  helper_method :authenticated?

  def current_user
    @current_user ||= User.find_by_id_and_created_at(session[:user_id],session[:user_created_at])
  end
  helper_method :current_user
  
  def false_list
    if /singularity/.match(url_for).nil?
      true
    else
      false
    end
  end
  helper_method :false_list
  
  def authentication_filter
    return if authenticated?
    redirect_to root_path
  end
  
end
