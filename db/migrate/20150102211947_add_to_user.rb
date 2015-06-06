class AddToUser < ActiveRecord::Migration
  def up
  	add_column :users, :cognoms, :string
    add_column :users, :nom, :string
    add_column :users, :nif, :string
    add_column :users, :adreca, :text
    add_column :users, :poblacio, :string 
    add_column :users, :postal, :string
    add_column :users, :telefono_casa, :string
    add_column :users, :telefono_celular, :string
  end

  def down
  	remove_column :users, :cognoms
    remove_column :users, :nom
    remove_column :users, :nif 
    remove_column :users, :adreca
    remove_column :users, :poblacio
    remove_column :users, :postal
    remove_column :users, :telefono_casa
    remove_column :users, :telefono_celular
 end
end
