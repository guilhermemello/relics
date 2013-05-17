class Profissao < ActiveRecord::Base
  attr_accessible :nome

  scope :todas, order("nome ASC")
end
