class Complaint < ActiveRecord::Base
  attr_accessible :cups, :empresa, :num_contador, :num_contrato, :num_contrato_acceso, :tinc, :user_id
  belongs_to :user 
  validates :cups, :empresa, :num_contador, :num_contrato, :num_contrato_acceso, :tinc , presence: :true 
end
