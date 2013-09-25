class Rito < ActiveRecord::Base
  attr_accessible :nome

  validates_presence_of :nome

  scope :todos, lambda { all }
end
