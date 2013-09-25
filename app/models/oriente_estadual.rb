class OrienteEstadual < ActiveRecord::Base
  attr_accessible :nome, :sigla, :url, :email, :telefone, :graomestre, :secretario, :estado_id, :cidade_id, :bairro_id, :endereco, :cep

  belongs_to :estado
  belongs_to :cidade
  belongs_to :bairro
  
  validates_presence_of :nome
  validates_presence_of :sigla
  validates_presence_of :url
  validates_presence_of :email

  scope :todos, lambda { all }
end
