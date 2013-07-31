class Foto < ActiveRecord::Base
  attr_accessible :evento_id, :imagem
  belongs_to :evento

  has_attached_file :imagem, :styles => { :thumb => "150x150>" }
end
