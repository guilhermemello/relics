class Obediencia < ActiveRecord::Base
  attr_accessible :nome, :sigla, :email

  scope :todas, lambda { all }
  
  attr_accessible :url, :telefone
  validates :email, :format => { :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i }
  
  validates_presence_of :nome
  validates_presence_of :sigla
  validates_presence_of :email
  
end
