# coding: utf-8

class DashboardController < ApplicationController
  layout "interno"

  before_filter :carregar_loja, :only => [:index]

  def index
    @date = params[:mes] ? Date.parse(params[:mes]) : Date.today
    Struct.new("Evento", :id, :data, :hora, :descricao, :tipo, :visibilidades, :objeto)
    @eventos = []

    if @loja.present?
      lojas = Loja.do_mesmo_estado(@loja)
      irmaos = @loja.membros
      eventos = @loja.eventos
    else
      lojas = []
      irmaos = []
      eventos = []
    end

    if irmaos.present?
      dependentes = Dependente.find_by_sql "SELECT pessoas.id, dependentes.dependente_id, pessoas.nome, pessoas.data_nascimento FROM pessoas INNER JOIN dependentes on dependentes.pessoa_id = pessoas.id WHERE dependentes.pessoa_id IN (#{irmaos.map(&:pessoa_id).join(", ")}) AND pessoas.data_nascimento <> 'NULL'"
    else
      dependentes = []
    end

    lojas.each do |loja|
      @eventos << Struct::Evento.new(nil, gerar_data_evento(loja.fundacao), DateTime.now, "Aniversário da loja #{loja.nome}", :aniversario_loja, [Visibilidade::MACONS], loja)
    end

    irmaos.each do |irmao|
      @eventos << Struct::Evento.new(nil, gerar_data_evento(irmao.pessoa.data_nascimento), DateTime.now, "Aniversário - #{irmao.pessoa.nome}", :aniversario_irmao, [Visibilidade::MEMBROS_DA_LOJA], irmao.pessoa)
    end

    dependentes.each do |dependente|
      @eventos << Struct::Evento.new(nil, gerar_data_evento(dependente.pessoa.data_nascimento), DateTime.now, "Aniversário - #{dependente.pessoa.nome}", :aniversario_dependente, [Visibilidade::MEMBROS_DA_LOJA], dependente)
    end

    eventos.each do |evento|
      @eventos << Struct::Evento.new(evento.id, gerar_data_evento(evento.data), DateTime.now, "#{evento.hora.strftime("%H:%M")} - #{evento.descricao}", :evento, evento.visibilidades, nil)
    end
  end

  private

  def carregar_loja
    @loja = Loja.where("id = ?", session[:loja_id]).first
  end

  def gerar_data_evento(objeto)
    objeto.change(:year => Date.today.year) if objeto.present?
  end
end
