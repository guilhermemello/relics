# coding: utf-8

class Fundador < Pessoa
  has_and_belongs_to_many :lojas
end
