# coding: utf-8

class Cargo < ActiveRecord::Base
  has_and_belongs_to_many :ritos

  has_many :eleicoes
  has_many :pessoas, :through => :eleicoes
end
