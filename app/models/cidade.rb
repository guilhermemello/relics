class Cidade < ActiveRecord::Base
  attr_accessible :nome, :uf, :estado

  belongs_to :estado

  def self.por_estado(estado_id)
    cidades = Cidade.where("estado_id = ?", estado_id).order("nome ASC")
    cidades.collect { |c| [c.nome, c.id] }
  end

  def self.por_estado_com_loja(estado_id)
    cidades = Cidade.select("DISTINCT cidades.id, cidades.nome")
                .where("cidades.estado_id = ?", estado_id)
                .joins("LEFT JOIN lojas ON lojas.bairro_id = bairros.id
                        LEFT JOIN templos ON templos.bairro_id =  bairros.id")
                .order("cidades.nome ASC")

    cidades.collect { |c| [c.nome, c.id] }
  end
end
