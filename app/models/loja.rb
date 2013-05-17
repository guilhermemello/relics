# coding: utf-8

class Loja < ActiveRecord::Base
  extend Enumerize

  attr_accessible :obediencia_id, :oriente_estadual_id, :nome, :rito_id, :templo_id, :circunscricao, :fundacao, :situacao, :estandarte, :curriculo, :numero, :dia, :hora, :estado_id, :cidade_id, :bairro_id, :endereco, :cep

  delegate :sigla, :to => :obediencia, :prefix => true
  delegate :sigla, :to => :oriente_estadual, :prefix => true
  delegate :nome, :to => :rito, :prefix => true
  delegate :uf, :to => :templo, :prefix => true, :allow_nil => true
  delegate :cidade_nome, :to => :templo, :prefix => true, :allow_nil => true

  belongs_to :obediencia
  belongs_to :oriente_estadual
  belongs_to :rito
  belongs_to :templo
  belongs_to :user
  has_and_belongs_to_many :users
  has_many :irmaos, :class_name => Pessoa
  belongs_to :estado
  belongs_to :cidade
  belongs_to :bairro
  has_many :eventos

  validates_presence_of :obediencia_id, :message => "informe uma obediência"
  validates_presence_of :oriente_estadual_id, :message => "informe um oriente estadual"
  validates_presence_of :nome, :message => "informe um nome"
  validates_presence_of :rito_id, :message => "informe um rito"
  validates :fundacao, :datetime => true

  enumerize :situacao, in: { :ativa => 1, :inativa => 0 }

  has_attached_file :estandarte, :styles => { :medium => "200x200>", :thumb => "100x100>" }, :default_url => "/assets/:style/missing.png"

  scope :todas, order("nome ASC")

  def membros
    Filiacao.joins(:pessoa).where("loja_id = ? AND filiado_em <> 'NULL' AND pessoas.data_nascimento <> 'NULL'", self.id).all
  end

  def membros_ids
    Filiacao.joins(:pessoa).where("loja_id = ? AND filiado_em <> 'NULL' AND pessoas.data_nascimento <> 'NULL'", self.id).map(&:pessoa_id)
  end

  def self.do_mesmo_estado(loja)
    if loja.templo.present?
      joins(:templo).where("templos.estado_id = ? AND lojas.fundacao <> 'NULL'", loja.templo.estado.id)
    else
      where("lojas.estado_id = ? AND lojas.fundacao <> 'NULL'", loja.estado.id)
    end
  end

  def possui_templo?
    true if templo.present?
  end
end
