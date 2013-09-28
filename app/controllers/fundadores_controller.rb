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

    # cria irmao
    if params[:nome].present? and params[:email].present?
     criar_irmao_usuario_e_fundador(params)
    end

    if @fundador.present?
      @loja.fundadores << @fundador

      redirect_to action: :index
    end
  end

  def criar_irmao_usuario_e_fundador(params)
    # irmao
    irmao = Fundador.new
    irmao.cim = params[:fundador][:cim]
    irmao.nome = params[:nome]
    irmao.email_particular = params[:email]
    irmao.categoria = Categoria::IRMAO

    if irmao.save(validate: false)
      irmao.filiar_a_loja(@loja)

      # usuario
      user = User.create!(:email => params[:email], :password => "123456", :password_confirmation => "123456", :confirmed_at => Time.now)
      user.roles << Role::USUARIO

      irmao.user_id = user.id
      irmao.save(validate: false)

      # fundador
      @loja.fundadores << irmao

      redirect_to action: :index
    end
  end

  def verificar_irmao
    existe = Fundador.where("cim = ?", params[:cim]).exists?

    render json: { :irmao_existe => existe }
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
