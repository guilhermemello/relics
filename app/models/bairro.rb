class Bairro < ActiveRecord::Base
  attr_accessible :cidade, :uf, :nome

  belongs_to :cidade

  def self.por_cidade(cidade_id)
    bairros = Bairro.where("cidade_id = ?", cidade_id).all
    bairros.collect { |c| [c.nome, c.id] }
  end
end
