# coding: utf-8

class Evento < ActiveRecord::Base
  attr_accessible :tipo_evento, :descricao, :data, :hora, :observacao, :visibilidade, :tipo_evento_id, :visibilidade_ids

  belongs_to :tipo_evento
  has_and_belongs_to_many :visibilidades
  belongs_to :loja

  delegate :nome, :to => :tipo_evento, :prefix => true

  validates_presence_of :tipo_evento_id, :message => "informe um tipo"
  validates_presence_of :descricao, :message => "informe uma descrição"
  validates_presence_of :data, :message => "informe uma data"
  validates_presence_of :hora, :message => "informe uma hora"
end
