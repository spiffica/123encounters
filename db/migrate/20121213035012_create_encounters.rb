class CreateEncounters < ActiveRecord::Migration
  def change
    create_table :encounters do |t|
      t.string :duration
      t.string :subject
      t.text :dialog
      t.references :contact

      t.timestamps
    end
    add_index :encounters, :contact_id
  end
end
