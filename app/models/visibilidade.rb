class Visibilidade < ActiveRecord::Base
  attr_accessible :nome

  scope :todas, lambda { all }

  MEMBROS_DA_LOJA = where("id = ?", 1).first
  MACONS = where("id = ?", 2).first
  DEPENDENTES = where("id = ?", 3).first
  PUBLICO = where("id = ?", 4).first
end
