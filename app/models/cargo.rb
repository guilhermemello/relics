# coding: utf-8

class Cargo < ActiveRecord::Base
  #scope :por_rito, lambda { |rito| where(:id => rito.id).order("nome ASC") }

  has_and_belongs_to_many :ritos
end
