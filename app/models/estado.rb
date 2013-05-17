class Estado < ActiveRecord::Base
  attr_accessible :nome, :uf

  scope :todos, order("uf ASC")
end
