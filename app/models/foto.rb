# coding: utf-8

class Foto < ActiveRecord::Base
  attr_accessible :evento_id, :imagem, :descricao
  belongs_to :evento

  has_attached_file :imagem, :styles => { :thumb => "200x150#" }
  validates_attachment_presence :imagem, :message => "Selecione uma foto válida"
  validates_attachment_size :imagem, :less_than => 1.megabytes, :message => "A foto deve possuir menos de 1MB"
end
