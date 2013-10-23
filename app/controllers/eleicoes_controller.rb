class EleicoesController < ApplicationController
  layout "interno"

  before_filter :carregar_dependencias, :only => [:index, :new, :create, :edit, :update, :destroy]

  def index
    @search = Eleicao.search(params[:search])
    @eleicoes = @search.select("DISTINCT eleicoes.*").where(:loja_id => @loja.id).joins("INNER JOIN cargos_ritos ON cargos_ritos.cargo_id = eleicoes.cargo_id").order("eleicoes.periodo DESC, cargos_ritos.ordem ASC").paginate(:page => params[:page])
  end

  def new
    @eleicao = Eleicao.new
  end

  def create
    @eleicao = Eleicao.new(params[:eleicao])
    @eleicao.loja = @loja

    pessoa = Pessoa.where("cim = ?", params[:cim]).first

    if pessoa.present?
      if @eleicao.save
        redirect_to :action => :index
      else
        render :action => :new
      end
    else
      criar_irmao_usuario(@eleicao, params)
    end
  end

  def criar_irmao_usuario(eleicao, params)
    # irmao
    irmao = Pessoa.new
    irmao.cim = params[:cim]
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
    end

    eleicao.pessoa = irmao
    if @eleicao.save
      redirect_to :action => :index
    else
      render :action => :new
    end
  end

  def edit
    @eleicao = Eleicao.where(id: params[:id]).first
    @irmao = Pessoa.where(id: params[:irmao_id]).first
  end

  def update
    @eleicao = Eleicao.where(id: params[:id]).first
    @eleicao.loja = @loja

    @irmao = Pessoa.where(id: params[:irmao_id]).first

    if @eleicao.update_attributes(params[:eleicao])
      redirect_to :action => :index
    else
      render :action => :edit
    end
  end

  def destroy
    @eleicao = Eleicao.where(id: params[:id]).first

    if @eleicao.present?
      @eleicao.destroy
    end

    redirect_to action: :index
  end

  def verificar_irmao
    irmao_existe = false
    pessoa = Pessoa.where("cim = ?", params[:cim]).first

    if pessoa.present?
      irmao_existe = true
    end

    render json: { irmao_existe: irmao_existe, irmao_id: pessoa.id, irmao_nome: pessoa.nome }
  end

  private

  def carregar_dependencias
    @loja = Loja.where("id = ?", session[:loja_id]).first
    @cargos = @loja.rito.cargos.collect { |cargo| [cargo.nome, cargo.id] }
  end
end
