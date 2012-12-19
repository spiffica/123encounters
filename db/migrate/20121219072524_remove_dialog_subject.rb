class RemoveDialogSubject < ActiveRecord::Migration
  def up
  	remove_column :encounters, :subject
  	remove_column :encounters, :dialog
  	remove_column :encounters, :duration
  	add_column :encounters, :duration, :integer
  	add_column :encounters, :time_of, :datetime
  end

  def down
  	add_column :encounters, :subject, :string
  	add_column :encounters, :dialog, :text
  	remove_column :encounters, :duration
  	add_column :encounters, :duration, :string
  	remove_column :encounters, :time_of
  end
end
