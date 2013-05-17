# coding: utf-8

class Categoria < ActiveRecord::Base
  attr_accessible :nome

  scope :todas, where("nome <> ?", "Irmão").order("id ASC")

  IRMAO = where("nome = ?", "Irmão").first
end
