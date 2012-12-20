class CreateDialogs < ActiveRecord::Migration
  def change
    create_table :dialogs do |t|
      t.text :content
      t.references :encounter
      t.references :contact
      t.references :user

      t.timestamps
    end
    add_index :dialogs, :encounter_id
    add_index :dialogs, :contact_id
    add_index :dialogs, :user_id
  end
end
