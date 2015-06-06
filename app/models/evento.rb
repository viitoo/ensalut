class Evento < ActiveRecord::Base
  resourcify
  attr_accessible :fecha, :hora, :lugar, :nombre
end
