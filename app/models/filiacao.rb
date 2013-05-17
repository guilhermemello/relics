# coding: utf-8

class Filiacao < ActiveRecord::Base
  attr_accessible :pessoa_id, :loja_id, :filiado_em

  belongs_to :loja
  belongs_to :pessoa

  scope :filiados, lambda { where("filiado_em <> 'NULL'") }
  scope :irmaos_filiados_em, lambda { |loja_id, pessoa_id| joins(:pessoa).where("loja_id = ? AND filiado_em <> 'NULL' AND pessoas.data_nascimento <> 'NULL'", loja_id) }

  def situacao
    if self.filiado_em.nil? and self.desfiliado_em.present?
      "Desfiliado"
    elsif self.filiado_em.present? and self.desfiliado_em.nil?
      "Filiado"
    end
  end
end
