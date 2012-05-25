class TasksController < ApplicationController

	def new
		@task = Task.new
	end

	def index
		@tasks = Task.by_task((params[:category_id].present? ? params[:category_id] : current_user.categories.first	))
		@categories = current_user.categories
	end

	def create
		@task = Task.new(params[:task])
		if @task.save
			redirect_to tasks_path
		else
			render :action => :new
		end
	end

	def edit
		@task = Task.find(params[:id])
		render :action => :new
	end

	def update
		@task = Task.find(params[:id])
		@task.update_attributes(params[:task])
		redirect_to tasks_path
	end

	def destroy
		@task = Task.find(params[:id])
		@task.destroy
		redirect_to tasks_path
	end

end
