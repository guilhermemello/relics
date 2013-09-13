# -*- encoding : utf-8 -*-

FactoryGirl.define do
  factory :sessao, :class => TipoEvento do
    nome "Sessão"
  end

  factory :evento_social, :class => TipoEvento do
    nome "Evento Social"
  end

  factory :eventos_maconicos, :class => TipoEvento do
    nome "Eventos Maçônicos"
  end
end
