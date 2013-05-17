class Obediencia < ActiveRecord::Base
  attr_accessible :nome, :sigla, :email

  scope :todas, lambda { all }
end
