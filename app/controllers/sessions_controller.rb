class SessionsController < ApplicationController

skip_before_filter :if_login

	def create
		@user = User.find_by_login_and_password(params[:login], params[:password])
		if @user && @user.registered
			session[:user_id] = @user.id
			redirect_to categories_path
		else
			render :action => :new
		end
	end

	def new
		if current_user
			redirect_to categories_path
		else
			@user = User.new
		end
	end

	def destroy
		session[:user_id] = nil
		redirect_to :action => :new
	end
end
