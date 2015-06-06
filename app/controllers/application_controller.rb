class ApplicationController < ActionController::Base
  protect_from_forgery
	rescue_from CanCan::AccessDenied do |exception|  
	  flash[:error] = "Access denied!"  
	  redirect_to  error_index_path
	end  

  def stored_location_for(resource_or_scope)
    nil
  end

  def after_sign_out_path_for(resource_or_scope)
    new_user_session_path 

  end

  def after_sign_in_path_for(resource)
   complaints_path
  end







end
