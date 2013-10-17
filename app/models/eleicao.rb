class Eleicao < ActiveRecord::Base
  attr_accessible :cargo_id, :periodo, :pessoa_id

  belongs_to :pessoa
  belongs_to :cargo

  def eleger(irmao, cargo, periodo)
    self.pessoa = irmao
    self.cargo = cargo
    self.periodo = periodo
    self.save
  end
end
