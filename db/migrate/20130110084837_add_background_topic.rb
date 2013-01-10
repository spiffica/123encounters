class AddBackgroundTopic < ActiveRecord::Migration
  def up
  	add_column :topics, :background, :text
  end

  def down
  	remove_column :topics, :background
  end
end
