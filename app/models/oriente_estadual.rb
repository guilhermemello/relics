class OrienteEstadual < ActiveRecord::Base
  attr_accessible :nome, :email, :estado, :cidade, :bairro

  belongs_to :estado
  belongs_to :cidade
  belongs_to :bairro

  scope :todos, lambda { all }
end
