class Estado < ActiveRecord::Base
  attr_accessible :nome, :uf

  scope :todos, order("uf ASC")
  scope :todos_com_loja, select("DISTINCT estados.id, estados.uf").joins("INNER JOIN lojas ON lojas.estado_id = estados.id").order("uf ASC")
end
