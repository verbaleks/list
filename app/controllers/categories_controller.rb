class CategoriesController < ApplicationController

	def new
		@category = Category.new
	end

	def index
		@categories = current_user.categories
	end

	def create
		@category = Category.new(params[:category])
		@category.user_id = current_user.id
		if @category.save
			redirect_to categories_path
		else
			render :action => :new
		end
	end

	def edit
		@category = Category.find(params[:id])
		render :action => :new
	end

	def destroy
		@category = Category.find(params[:id])
		@category.destroy
		redirect_to :action => :index
	end

	def update
		@category = Category.find(params[:id])
		@category.update_attributes(params[:category])
		redirect_to :action => :index
	end

end
