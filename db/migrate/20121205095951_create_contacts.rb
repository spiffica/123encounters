class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :first_name
      t.string :last_name
      t.string :company
      t.string :position
      t.string :email
      t.string :phone
      t.references :user

      t.timestamps
    end
    add_index :contacts, :user_id
  end
end
