class ChangePositionToString < ActiveRecord::Migration
  def up
		change_table :tasks do |t|
      t.change :position, :string
		end
  end

  def down
		change_table :tasks do |t|
    	t.change :position, :integer
		end
  end
end
