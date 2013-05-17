class Role < ActiveRecord::Base
  has_and_belongs_to_many :users, :join_table => :users_roles
  belongs_to :resource, :polymorphic => true
  
  scopify

  ADMIN_LOJA = 2
  USUARIO = where("name = ?", "usuario").first

  scope :todas, order("id ASC")
end
