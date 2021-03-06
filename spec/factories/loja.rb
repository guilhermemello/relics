# -*- encoding : utf-8 -*-

FactoryGirl.define do
  factory :equidade, :class => Loja do
    nome "Equidade"
    fundacao Date.parse("01-01-2010")
    curriculo "Loja mais antiga do Brasil"
    association :templo, factory: :templo_equidade
    obediencia_id 1
    oriente_estadual_id 1
    rito_id 1
  end
end
