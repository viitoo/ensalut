class AddFields < ActiveRecord::Migration
  def up
  	add_column :configuracions , :campana, :float
	add_column :configuracions , :campana_meta, :float
	add_column :configuracions , :dias , :integer
	add_column :configuracions , :donaciones , :integer
	add_column :configuracions , :mensaje1 , :string
	add_column :configuracions , :mensaje2 , :string	
	add_column :configuracions , :mensaje3 , :string
  end

  def down
	remove_column :configuracions , :campana
	remove_column :configuracions , :campana_meta
	remove_column :configuracions , :dias
	remove_column :configuracions , :donaciones
	remove_column :configuracions , :mensaje1
	remove_column :configuracions , :mensaje2
	remove_column :configuracions , :mensaje3
  end
end
