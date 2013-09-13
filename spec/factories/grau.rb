# -*- encoding : utf-8 -*-

FactoryGirl.define do
  factory :aprendiz, :class => Grau do
    nome "Aprendiz"
  end

  factory :companheiro, :class => Grau do
    nome "Companheiro"
  end

  factory :mestre, :class => Grau do
    nome "Mestre"
  end

  factory :mestre_instalado, :class => Grau do
    nome "Mestre Instalado"
  end
end
