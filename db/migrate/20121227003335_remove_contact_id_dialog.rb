class RemoveContactIdDialog < ActiveRecord::Migration
  def up
  	remove_column :dialogs, :contact_id
  	remove_column :dialogs, :user_id
  end

  def down
  	add_column :dialogs, :contact_id, :integer
  	add_column :dialogs, :user_id, :integer
  end
end
