class TasksController < ApplicationController
	helper_method :sort_column, :sort_direction, :selected_category_id
	def new
		@task = Task.new
	end

	def index
		if sort_by_drag_and_drop
			if params[:category_id] 
				@tasks = Task.by_category(params[:category_id])
											.search(params[:search])
											.sort_by { |task| task.position[params[:category_id]] }
			else
				@tasks = Task.by_category({})
				@tasks = @tasks.sort_by { |task| task.position["-1"] }
			end
		else
			@tasks = Task.by_task(params[:category_id]).order("`" + sort_column + "` " + sort_direction).search(params[:search])
		end
		@categories_for_select = current_user.categories.map{|a| [a.title, a.id] }
		@categories_for_select += [["all", "-1"]]
	end

	def create
		@task = Task.new(params[:task])
		@task.user_id = current_user.id
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

	def position
		params["task"].each_with_index do |id, index|
			task = Task.find(id)
			task.position[params[:category_id]] = index
			task.save
		end
		render :nothing => true
	end

	def sort_by_drag_and_drop
		if params[:sort]
			false
		else
			true
		end
	end

	private

	def sort_column
		if sort_by_drag_and_drop
			false
		else
			Task.column_names.include?(params[:sort]) ? params[:sort] : "title"
		end
	end

	def sort_direction
		if sort_by_drag_and_drop
			false
		else
			%w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
		end
	end

	def selected_category_id
		params[:category_id] ? params[:category_id] : "-1"
	end

end
