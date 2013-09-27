# coding: utf-8

class FundadoresController < ApplicationController
  layout "interno"

  before_filter :carregar_loja, :only => [:index, :new, :create]

  def new
    @fundador = Fundador.new
  end

  def index
    @search = Fundador.search(params[:search])
    @fundadores = @loja.fundadores.search(params[:search]).paginate(:page => params[:page])
  end

  def create
    @fundador = Fundador.where("cim = ?", params[:fundador][:cim]).first

    if @fundador.present?
      @loja.fundadores << @fundador

      redirect_to action: :index
    else
      @fundador = Fundador.new
      flash[:notice] = "CIM inválido"

      render action: :new
    end
  end

  private

  def carregar_loja
    @loja = Loja.where("id = ?", session[:loja_id]).first
  end
end
