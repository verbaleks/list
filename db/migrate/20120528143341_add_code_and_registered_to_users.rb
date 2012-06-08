class AddCodeAndRegisteredToUsers < ActiveRecord::Migration
  def up
		add_column :users, :code, :string
		add_column :users, :registered, :string
  end

  def down
		remove_column :users, :code
		remove_column :users, :registered
  end
end
