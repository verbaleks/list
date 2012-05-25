class ApplicationController < ActionController::Base
  protect_from_forgery

	helper_method :current_user

	before_filter :if_login

def if_login
	if current_user
	else
		redirect_to new_session_path
	end
end

	def current_user
		@current_user ||= User.find(session[:user_id]) if session[:user_id]
	end
end
