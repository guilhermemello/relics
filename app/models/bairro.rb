class Bairro < ActiveRecord::Base
  attr_accessible :cidade, :uf, :nome

  belongs_to :cidade

  def self.por_cidade(cidade_id)
    bairros = Bairro.where("cidade_id = ?", cidade_id).all
    bairros.collect { |c| [c.nome, c.id] }
  end

  def self.por_cidade_com_loja(cidade_id)
    bairros = Bairro.select("DISTINCT bairros.id, bairros.nome")
                .where("templos.cidade_id = ? OR lojas.cidade_id = ?", cidade_id, cidade_id)
                .joins("LEFT JOIN lojas ON lojas.bairro_id = bairros.id
                        LEFT JOIN templos ON templos.bairro_id =  bairros.id")
                .order("bairros.nome ASC")

    bairros.collect { |c| [c.nome, c.id] }
  end
end
