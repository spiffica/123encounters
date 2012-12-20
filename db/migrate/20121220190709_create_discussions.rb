class CreateDiscussions < ActiveRecord::Migration
  def change
    create_table :discussions do |t|
      t.integer :encounter_id
      t.integer :topic_id

      t.timestamps
    end
  end
end
