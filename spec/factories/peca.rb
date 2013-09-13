# -*- encoding : utf-8 -*-

FactoryGirl.define do
  factory :peca, :class => Peca do
    tema "Os Três Filósofos"
    association :categoria, factory: :ritual
    grau_id 1
    association :autor, factory: :suse_pessoa
    association :responsavel, factory: :suse_pessoa
    tipo_documento 1
    texto "conteúdo de uma peça de arquitetura"
  end
end
