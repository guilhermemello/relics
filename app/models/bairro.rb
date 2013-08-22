class Bairro < ActiveRecord::Base
  attr_accessible :cidade, :uf, :nome

  belongs_to :cidade

  def self.por_cidade(cidade_id)
    bairros = Bairro.where("cidade_id = ?", cidade_id).all
    bairros.collect { |c| [c.nome, c.id] }
  end

  def self.por_cidade_com_loja(cidade_id)
    bairros = Bairro.select("DISTINCT bairros.id, bairros.nome").where("bairros.cidade_id = ?", cidade_id).joins("INNER JOIN lojas ON lojas.bairro_id = bairros.id").all
    bairros.collect { |c| [c.nome, c.id] }
  end
end
