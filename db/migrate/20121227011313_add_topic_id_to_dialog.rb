class AddTopicIdToDialog < ActiveRecord::Migration
  def up
  	add_column :dialogs, :topic_id, :integer
    add_index :dialogs, :topic_id
  end
  def down
  	remove_column :dialogs, :topic_id
  end
end
