class CreateTasks < ActiveRecord::Migration
  def change
		create_table :tasks do |t|
			t.string		:title
			t.text 		:task
			t.date		:from
			t.date			:to
			t.timestamps
    end
  end
end
