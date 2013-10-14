class LojasController < ApplicationController
  layout "interno"

  #load_and_authorize_resource
  before_filter :combos, :only => [:index, :new, :create, :edit, :update]
  before_filter :carregar_loja, :only => [:administrar]

  def index
    @search = Loja.search(params[:search])
    @ufs = Estado.todos_com_loja.collect { |r| [r.uf, r.id] }
    @lojas = @search.order("nome ASC").paginate(:page => params[:page])
  end

  def new
    @loja = Loja.new
  end

  def create
    @loja = Loja.new(params[:loja])

    if params[:loja][:templo_id].present?
      @loja.endereco = nil
      @loja.bairro_id = nil
      @loja.cidade_id = nil
      @loja.estado_id = nil
      @loja.cep = nil
    else
      @loja.endereco = params[:loja][:endereco]
      @loja.bairro_id = params[:loja][:bairro_id]
      @loja.cidade_id = params[:loja][:cidade_id]
      @loja.estado_id = params[:loja][:estado_id]
      @loja.cep = params[:loja][:cep]
    end

    if @loja.save
      redirect_to :action => :index
    else
      render :action => :new
    end
  end

  def edit
    @loja = Loja.where("id = ?", params[:id]).first
  end

  def update
    @loja = Loja.where("id = ?", params[:id]).first

    if params[:loja][:templo_id].present?
      @loja.endereco = nil
      @loja.bairro_id = nil
      @loja.cidade_id = nil
      @loja.estado_id = nil
      @loja.cep = nil
    else
      @loja.endereco = params[:loja][:endereco]
      @loja.bairro_id = params[:loja][:bairro_id]
      @loja.cidade_id = params[:loja][:cidade_id]
      @loja.estado_id = params[:loja][:estado_id]
      @loja.cep = params[:loja][:cep]
    end

    if @loja.update_attributes(params[:loja])
      redirect_to :action => :index
    else
      render :action => :edit
    end
  end

  def destroy
    @loja = Loja.where("id = ?", params[:id]).first
    @loja.destroy

    redirect_to :action => :index
  end

  def carregar_dados_templo
    @templo = Templo.where("id = ?", params[:templo_id]).first
  end

  def carregar_dados_endereco
    @loja = Loja.where("id = ?", params[:loja_id]).first
  end

  def administrar
    @cargos = @loja.rito.cargos
  end

  private

  def combos
    @obediencias = Obediencia.todas.collect { |o| [o.sigla, o.id] }  
    @orientes_estaduais = OrienteEstadual.todos.collect { |oe| [oe.sigla, oe.id] }
    @ritos = Rito.todos.collect { |r| [r.nome, r.id] }
    @ufs = Estado.todos.collect { |r| [r.uf, r.id] }
    @templos = Templo.todos.collect { |t| [t.nome, t.id ]}
  end

  def carregar_loja
    @loja = Loja.where("id = ?", session[:loja_id]).first
  end
end
