class AddUserIdEncounter < ActiveRecord::Migration
  def up
  	add_column :encounters, :user_id, :integer
  end

  def down
  	remove_column :encounters, :user_id
  end
end
