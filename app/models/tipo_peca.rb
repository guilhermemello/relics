class TipoPeca < ActiveRecord::Base
  attr_accessible :nome

  scope :todos, order("nome ASC")

  def to_s
    self.nome
  end
end
