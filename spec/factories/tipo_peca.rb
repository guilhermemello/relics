# -*- encoding : utf-8 -*-

FactoryGirl.define do
  factory :ritual, :class => TipoPeca do
    nome "Ritual"
  end

  factory :simbolos, :class => TipoPeca do
    nome "Símbolos"
  end

  factory :personagens_historicos, :class => TipoPeca do
    nome "Personagens Históricos"
  end
end
