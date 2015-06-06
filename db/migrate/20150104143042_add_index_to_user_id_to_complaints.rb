class AddIndexToUserIdToComplaints < ActiveRecord::Migration
  def change
  	add_column :complaints, :user_id,:integer
  end
end