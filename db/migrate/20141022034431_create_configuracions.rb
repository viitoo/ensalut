class CreateConfiguracions < ActiveRecord::Migration
  def change
    create_table :configuracions do |t|
      t.text :texto1
      t.text :texto2
      t.text :texto3
      t.text :texto4
      t.text :somos

      t.timestamps
    end
  end
end
