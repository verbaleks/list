class UsersController < ApplicationController
skip_before_filter :if_login
	def index
		@users = User.all
	end

	def new
		@user = User.new
	end

	def create
		@user = User.new(params[:user])
		if @user.save
			redirect_to new_session_path
		else
			render :action => :new
		end
	end

	def edit
		@user = User.find(params[:id])
		render :action => :new
	end

	def update
		@user = User.find(params[:id])
		@user.update_attributes(params[:user])
		redirect_to new_session_path
	end

	def destroy
		@user = User.find(params[:id])
		@user.destroy
		redirect_to new_session_path
	end

end
