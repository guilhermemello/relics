# -*- encoding : utf-8 -*-
# 
FactoryGirl.define do
  factory :obediencia, :class => Obediencia do
    nome "Grande Oriente do Brasil"
    sigla "GOB"
    url "www.gob.com.br"
    email "gob@gob.com.br"
    estado_id 1
    cidade_id 1
    bairro_id 1
  end
end