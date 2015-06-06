class CamposSlider < ActiveRecord::Migration
  def up
  	remove_column :configuracions, :texto2
  	remove_column :configuracions, :texto3
 	remove_column :configuracions, :texto4
	remove_column :configuracions,:mensaje1
	remove_column :configuracions,:mensaje2
	remove_column :configuracions,:mensaje3

  end

  def down
  end

end
