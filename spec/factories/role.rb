# -*- encoding : utf-8 -*-
FactoryGirl.define do
  factory :usuario, :class => Role do
    name "usuario"
  end

  factory :admin_loja, :class => Role do
    name "admin_loja"
  end
  
  factory :admin_ambiente, :class => Role do
    name "admin_ambiente"
  end

  factory :admin_master, :class => Role do
    name "admin_master"
  end
end