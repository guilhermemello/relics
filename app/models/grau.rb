class Grau < ActiveRecord::Base
  attr_accessible :nome

  scope :todos, order("nome ASC")
  scope :hierarquia, lambda { |current_user| where("id <= ?", current_user.pessoa.grau.id).all }

  GRAU_MAXIMO = 100

  def to_s
    self.nome
  end
end
