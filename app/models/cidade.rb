class Cidade < ActiveRecord::Base
  attr_accessible :nome, :uf, :estado

  belongs_to :estado

  def self.por_estado(estado_id)
    cidades = Cidade.where("estado_id = ?", estado_id).all
    cidades.collect { |c| [c.nome, c.id] }
  end
end
