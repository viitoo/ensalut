class CreateEventos < ActiveRecord::Migration
  def change
    create_table :eventos do |t|
      t.date :fecha
      t.string :nombre
      t.time :hora
      t.string :lugar

      t.timestamps
    end
  end
end
