# coding: utf-8

class Dependente < ActiveRecord::Base
  attr_accessible :pessoa_id, :dependente_id

  belongs_to :pessoa, :foreign_key => "dependente_id"

  delegate :nome, :to => :pessoa, :prefix => true
  delegate :data_nascimento, :to => :pessoa, :prefix => true, :allow_nil => true
  delegate :telefone_celular, :to => :pessoa, :prefix => true, :allow_nil => true
  delegate :email_particular, :to => :pessoa, :prefix => true, :allow_nil => true
  delegate :profissao, :to => :pessoa, :prefix => true, :allow_nil => true
end
