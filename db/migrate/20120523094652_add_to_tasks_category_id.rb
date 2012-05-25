class AddToTasksCategoryId < ActiveRecord::Migration
  def up
		add_column :tasks, :category_id, :integer
  end

  def down
		remove_column :tasks, :category_id
  end
end
