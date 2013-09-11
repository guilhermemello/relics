class Peca < ActiveRecord::Base
  attr_accessible :tema, :grau_id, :autor_id, :autor, :responsavel_id, :texto, :tipo_documento, :autor_nome, :arquivo, :tipo_peca_id, :visibilidade_ids

  TEXTO = 1
  ARQUIVO = 2

  belongs_to :autor, :class_name => "Pessoa", :foreign_key => "autor_id"
  belongs_to :responsavel, :class_name => "Pessoa", :foreign_key => "responsavel_id"
  belongs_to :tipo_evento
  has_and_belongs_to_many :visibilidades

  has_attached_file :arquivo

  validates_presence_of :tema, :grau_id, :responsavel_id
  validates_length_of :tema, :maximum => 100
end
