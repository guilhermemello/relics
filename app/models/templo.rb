class Templo < ActiveRecord::Base
  attr_accessible :nome, :endereco, :cep, :estado, :cidade, :bairro

  delegate :uf, :to => :estado

  belongs_to :estado
  belongs_to :cidade
  belongs_to :bairro

  def cidade_nome
    self.cidade.nome
  end

  scope :todos, order("nome ASC")
end
