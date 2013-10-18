class Eleicao < ActiveRecord::Base
  attr_accessible :cargo_id, :periodo, :pessoa_id, :loja_id

  belongs_to :pessoa
  belongs_to :cargo
  belongs_to :loja

  validates_presence_of :cargo_id
  validates_presence_of :periodo

  def eleger(irmao, cargo, periodo)
    self.pessoa = irmao
    self.cargo = cargo
    self.periodo = periodo
    self.save
  end
end
