class AddEncTypeToEncounters < ActiveRecord::Migration
  def change
    add_column :encounters, :enc_type, :string
  end
end
