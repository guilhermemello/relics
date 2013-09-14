# -*- encoding : utf-8 -*-

FactoryGirl.define do
  factory :templo_equidade, :class => Templo do
    nome "JPLSJ EQUIDADE"
    endereco "R. DO LAVRADIO, 97 - CP 91042"
    cep "20230-070"
    estado_id 1
    cidade_id 1
    bairro_id 1
  end
end