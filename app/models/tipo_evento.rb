class TipoEvento < ActiveRecord::Base
  attr_accessible :nome

  scope :todos, lambda { all }
end
