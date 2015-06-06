class User < ActiveRecord::Base
  rolify
  include Humanizer
  require_human_on :create


  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


  attr_accessible :email, :password, :password_confirmation, :remember_me,:humanizer_answer,:humanizer_question_id,:cognoms,:nom,:nif ,:adreca,:poblacio,:postal,:telefono_casa,:telefono_celular
  
  validates  :cognoms,:nom,:nif ,:adreca,:poblacio,:postal,:telefono_casa,:telefono_celular , presence: true
  validates :email, :uniqueness => { :case_sensitive => false } 
  validates :nif, uniqueness: true 
  after_create :asignar_rol_por_defecto

  has_many :complaints

  def asignar_rol_por_defecto
    add_role(:manager)
  end




end
