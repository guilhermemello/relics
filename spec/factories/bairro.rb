# -*- encoding : utf-8 -*-

FactoryGirl.define do
  factory :centro, :class => Bairro do
    nome "Centro"
    uf "RJ"
    cidade_id 1
  end
end
