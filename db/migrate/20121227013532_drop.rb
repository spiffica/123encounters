class Drop < ActiveRecord::Migration
  def up
  	drop_table :discussions
  end

end
