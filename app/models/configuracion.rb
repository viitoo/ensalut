class Configuracion < ActiveRecord::Base
  resourcify
  attr_accessible :somos, :texto1,:campana,:campana_meta,:dias , :donaciones,:status
  
  validates :somos, :texto1, presence: true
  


end


