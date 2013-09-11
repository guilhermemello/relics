# coding: utf-8

class Pessoa < ActiveRecord::Base
  extend Enumerize

  attr_accessible :cpf, :nome, :categoria_id, :grau_id, :user_id, :email_particular, :cim, :telefone_celular, :nome_pai, :nome_mae, :data_nascimento, :estado_nascimento_id, :pais_nascimento_id, :endereco,
    :bairro_id, :cidade_id, :estado_id, :cep, :telefone_residencial, :aposentado, :empresa, :profissao_id, :telefone_comercial, :email_comercial, :ramal, :foto, :iniciacao_em, :elevacao_em, :exaltacao_em, :instalacao_em

  belongs_to :categoria
  belongs_to :grau
  belongs_to :user
  belongs_to :estado
  belongs_to :cidade
  belongs_to :bairro
  belongs_to :pais_nascimento, :foreign_key => "pais_nascimento_id"
  belongs_to :estado_nascimento, :foreign_key => "estado_nascimento_id"
  belongs_to :profissao
  has_many :filiacoes, :class_name => Loja, :finder_sql => Proc.new { "SELECT lojas.id, lojas.nome FROM filiacoes INNER JOIN lojas ON lojas.id = filiacoes.loja_id AND filiacoes.pessoa_id = #{id} ORDER BY lojas.nome ASC" }

  delegate :nome, :to => :profissao, :prefix => true, :allow_nil => true
  delegate :nome, :to => :categoria, :prefix => true, :allow_nil => true

  validates_presence_of :cpf, :message => "informe um CPF", :if => Proc.new { |pessoa| pessoa.categoria == Categoria::IRMAO and pessoa.cim == nil }
  validates_presence_of :nome, :message => "informe um nome"
  validates_presence_of :categoria_id, :message => "informe um grau de parentesco"
  validates_presence_of :grau_id, :message => "informe um grau", :if => Proc.new { |pessoa| pessoa.categoria == Categoria::IRMAO }
  validates_presence_of :email_particular, :message => "informe um e-mail particular", :if => Proc.new { |pessoa| pessoa.categoria == Categoria::IRMAO }
  validates_presence_of :data_nascimento, :message => "informe uma data de nascimento"#, :if => Proc.new { |pessoa| pessoa.categoria != Categoria::IRMAO }
  validates :email_particular, :format => { :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i }, :if => Proc.new { |pessoa| pessoa.categoria == Categoria::IRMAO }

  has_attached_file :foto, :styles => { :medium => "200x200>", :thumb => "28x50" }, :default_url => "/assets/:style/missing.png"

  enumerize :aposentado, in: { :sim => 1, :nao => 2 }

  validate :validar_tamanho_foto

  def validar_tamanho_foto
    errors.add(:foto, "A foto deve possuir menos de 400K") if self.foto_file_size.present? and self.foto_file_size > 400.kilobytes
  end

  #scope :possui_filiacaao?, lambda { |cpf|
  #  where("cpf = ?", params[:cpf]).first
  #}

  scope :dependentes, lambda { |irmao|
    joins("INNER JOIN `dependentes` ON `dependentes`.`dependente_id` = `pessoas`.`id`").where("dependentes.pessoa_id = ?", irmao.id).order("created_at DESC")
  }

  def filiar_a_loja(loja)
    Filiacao.create(:pessoa_id => self.id, :loja_id=> loja.id, :filiado_em => DateTime.now)
  end

  def desfiliar_de_loja(loja)
    filiacao = Filiacao.where("pessoa_id = ? AND loja_id = ?", self.id, loja.id).first
    filiacao.filiado_em = nil
    filiacao.desfiliado_em = DateTime.now
    filiacao.save
  end

  def criar_usuario
    #password = Devise.friendly_token.first(6)

    user = User.create!(:email => self.email_particular, :password => "123456", :password_confirmation => "123456", :confirmed_at => Time.now)
    user.roles << Role::USUARIO

    self.update_attributes!(:user_id => user.id)

    Message.bem_vindo(self, user).deliver
  end

  def que_esta_logado?(current_user)
    self.user == current_user
  end

  def adicionar_dependente(dependente)
    Dependente.create(:pessoa_id => self.id, :dependente_id => dependente.id)
  end

  def remover_dependente(dependente)
    dependente = Dependente.where("pessoa_id = ? AND dependente_id = ?", self.id, dependente.id).first
    dependente.destroy
  end

  def cpf=(value)
    value.gsub!(/[.-]/, "")
    write_attribute(:cpf, value)
  end

  def possui_data_de_nascimento?
    true if data_nascimento.present?
  end
end