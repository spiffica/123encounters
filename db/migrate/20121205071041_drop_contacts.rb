class DropContacts < ActiveRecord::Migration
  def up
  	drop_table :contacts
  end

end
