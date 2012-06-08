class AddToTasksPosition < ActiveRecord::Migration
  def up
		add_column :tasks, :position, :integer

  end

  def down
		remove_column :tasks, :position
  end
end
