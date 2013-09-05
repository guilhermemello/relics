class Obediencia < ActiveRecord::Base
  attr_accessible :nome, :sigla, :email, :url, :telefone, :graomestre, :secretario, :jurisdicao, :estado_id, :cidade_id, :bairro_id, :endereco, :cep

  scope :todas, lambda { all } 
  validates :email, :format => { :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i }
  
  validates_presence_of :nome
  validates_presence_of :sigla
  validates_presence_of :email
  validates_presence_of :url

  belongs_to :estado
  belongs_to :cidade
  belongs_to :bairro
end
