class Grau < ActiveRecord::Base
  attr_accessible :nome

  scope :todos, order("nome ASC")

  GRAU_MAXIMO = 100

  def to_s
    self.nome
  end
end
