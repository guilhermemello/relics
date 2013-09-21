class Peca < ActiveRecord::Base
  attr_accessible :tema, :grau_id, :autor_id, :autor, :responsavel_id, :texto, :tipo_documento, :autor_nome, :arquivo, :tipo_peca_id, :visibilidade_ids

  TEXTO = 1
  ARQUIVO = 2

  AUTOR_IRMAO = 1
  AUTOR_OUTRO = 2

  VALID_CONTENT_TYPES = ["application/pdf"]

  belongs_to :autor, :class_name => "Pessoa", :foreign_key => "autor_id"
  belongs_to :responsavel, :class_name => "Pessoa", :foreign_key => "responsavel_id"
  belongs_to :categoria, :class_name => "TipoPeca", :foreign_key => "tipo_peca_id"
  belongs_to :grau
  has_and_belongs_to_many :visibilidades

  has_attached_file :arquivo

  validates_presence_of :tema, :grau_id, :tipo_peca_id, :responsavel_id
  validates_length_of :tema, :maximum => 100
  validate :attachment_content_type
  validate :autoria
  validate :documento
  validate :visibilidade


  def visibilidade
    if visibilidades.count == 0
      errors.add(:visibilidades, "Selecione a visibilidade")
    end
  end

  def attachment_content_type
    if self.arquivo_file_name.present?
      if !VALID_CONTENT_TYPES.include?(self.arquivo_content_type)
        errors.add(:arquivo, "Somente arquivos PDF são aceitos")
      end
    end
  end

  def documento
    if self.texto.blank? and self.arquivo_file_name.nil?
      errors.add(:texto, "Informe o texto ou documento")
    end
  end

  def autoria
    if self.autor.nil? and self.autor_nome.blank?
      errors.add(:autor_id, "Informe um autor")
    end
  end
end
