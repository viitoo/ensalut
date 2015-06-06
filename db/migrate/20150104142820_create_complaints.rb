class CreateComplaints < ActiveRecord::Migration
  def change
    create_table :complaints do |t|
      t.string :empresa
      t.string :num_contrato
      t.string :num_contrato_acceso
      t.string :cups
      t.string :num_contador
      t.boolean :tinc

      t.timestamps
    end
  end
end
