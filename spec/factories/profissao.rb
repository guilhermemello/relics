# -*- encoding : utf-8 -*-

FactoryGirl.define do
  factory :advogado, :class => Profissao do
    nome "Advogado"
  end

  factory :alergista, :class => Profissao do
    nome "Alergista"
  end
end