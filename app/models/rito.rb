class Rito < ActiveRecord::Base
  attr_accessible :nome, :sigla

  scope :todos, lambda { all }
end
