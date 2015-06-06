class AddStatus < ActiveRecord::Migration
  def up
  	add_column :configuracions , :status , :boolean
  end

  def down
  	remove_column :configuracions , :status
  end
end
