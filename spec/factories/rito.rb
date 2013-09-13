# -*- encoding : utf-8 -*-

FactoryGirl.define do
  factory :schoder, :class => Rito do
    nome "Schoder"
  end

  factory :brasileiro, :class => Rito do
    nome "Brasileiro"
  end
end