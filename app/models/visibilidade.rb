class Visibilidade < ActiveRecord::Base
  attr_accessible :nome

  scope :todas, lambda { all }

  MEMBROS_DA_LOJA = 1
  MACONS = 2
  DEPENDENTES = 3
  PUBLICO = 4
end
