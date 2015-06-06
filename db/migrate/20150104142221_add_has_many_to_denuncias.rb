class AddHasManyToDenuncias < ActiveRecord::Migration
  def change
  	add_index :denuncia ,:user_id
  end
end
