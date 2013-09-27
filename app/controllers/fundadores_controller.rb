# coding: utf-8

class FundadoresController < ApplicationController
  layout "interno"

  before_filter :carregar_loja, :only => [:index, :new, :create, :destroy]

  def new
    @fundador = Fundador.new
  end

  def index
    @search = Fundador.search(params[:search])
    @fundadores = @loja.fundadores.order("nome ASC").search(params[:search]).paginate(:page => params[:page])
  end

  def create
    @fundador = Fundador.where("cim = ?", params[:fundador][:cim]).first

    if @fundador.present?
      @loja.fundadores << @fundador

      redirect_to action: :index
    end
  end

  def verificar_irmao
    fundador = Fundador.where("cim = ?", params[:cim]).exists?

    render json: { :irmao_existe => fundador, :cim => params[:cim] }
  end

  def destroy
    fundador = Fundador.where("id = ?", params[:id]).first

    if @loja.fundadores.size > 0 and fundador.present?
      @loja.fundadores.delete(fundador)
    end

    redirect_to :action => :index
  end

  private

  def carregar_loja
    @loja = Loja.where("id = ?", session[:loja_id]).first
  end
end
