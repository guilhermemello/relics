# coding: utf-8

class DependentesController < ApplicationController
  layout "interno"

  before_filter :combos, :only => [:new, :create, :edit, :update]

  def new
    @dependente = Pessoa.new
  end

  def create
    @irmao = Pessoa.where("id = ?", params[:irmao_id]).first
    @dependente = Pessoa.new(params[:pessoa])

    if @dependente.save
      @irmao.adicionar_dependente(@dependente)

      redirect_to "/irmaos/#{params[:irmao_id]}/edit?loja_id=#{session[:loja_id]}#dependentes"
    else
      render :action => :new
    end
  end

  def edit
    @irmao = Pessoa.where("id = ?", params[:irmao_id]).first
    @dependente = Pessoa.where("id = ?", params[:id]).first
  end

  def update
    @dependente = Pessoa.where("id = ?", params[:id]).first

    if @dependente.update_attributes(params[:pessoa])
      redirect_to "/irmaos/#{params[:irmao_id]}/edit?loja_id=#{session[:loja_id]}#dependentes"
    else
      render :action => :edit
    end
  end

  def destroy
    @irmao = Pessoa.where("id = ?", params[:irmao_id]).first
    dependente = Pessoa.where("id = ?", params[:id]).first
    @irmao.remover_dependente(dependente)

    redirect_to "/irmaos/#{params[:irmao_id]}/edit?loja_id=#{session[:loja_id]}#dependentes"
  end

  private

  def combos
    @parentesco = Categoria.todas.collect { |c| [c.nome, c.id] }
    @ufs = Estado.todos.collect { |r| [r.uf, r.id] }
    @profissoes = Profissao.todas.collect { |r| [r.nome, r.id] }
  end
end
