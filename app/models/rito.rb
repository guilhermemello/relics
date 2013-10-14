class Rito < ActiveRecord::Base
  attr_accessible :nome

  has_and_belongs_to_many :cargos

  validates_presence_of :nome

  scope :todos, lambda { all }
end
