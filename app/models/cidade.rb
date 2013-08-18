class Cidade < ActiveRecord::Base
  attr_accessible :nome, :uf, :estado

  belongs_to :estado

  def self.por_estado(estado_id)
    cidades = Cidade.where("estado_id = ?", estado_id).all
    cidades.collect { |c| [c.nome, c.id] }
  end

  def self.por_estado_com_loja(estado_id)
    cidades = Cidade.select("DISTINCT cidades.id, cidades.nome").where("cidades.estado_id = ?", estado_id).joins("INNER JOIN lojas ON lojas.cidade_id = cidades.id").all
    cidades.collect { |c| [c.nome, c.id] }
  end
end
