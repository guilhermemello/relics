# -*- encoding : utf-8 -*-

FactoryGirl.define do
  factory :aprendiz, :class => Grau do
    id 1
    nome "Aprendiz"
  end

  factory :companheiro, :class => Grau do
    id 2
    nome "Companheiro"
  end

  factory :mestre, :class => Grau do
    id 3
    nome "Mestre"
  end

  factory :mestre_instalado, :class => Grau do
    id 4
    nome "Mestre Instalado"
  end
end
