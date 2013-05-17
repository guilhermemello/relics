class Pais < ActiveRecord::Base
  attr_accessible :nome

  scope :todos, order("nome ASC")
end
