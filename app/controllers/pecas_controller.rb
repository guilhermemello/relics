class PecasController < ApplicationController
  layout "interno"

  before_filter :carregar_loja, :only => [:index, :new, :create, :edit, :update]
  before_filter :combos, :only => [:new, :index, :create, :edit, :update]

  def index
    if params[:grau_id].present?
      search = { "grau_id_less_than_or_equal_to" => params[:grau_id] }.merge(params[:search] || {})
    else
      if current_user.has_role?(:admin_master)
        search = { "grau_id_less_than_or_equal_to" => Grau::GRAU_MAXIMO }.merge(params[:search] || {})
      else
        search = { "grau_id_less_than_or_equal_to" => current_user.pessoa.grau.id }.merge(params[:search] || {})
      end
    end

    @search = Peca.search(search)
    @pecas = @search.order("created_at DESC").paginate(:page => params[:page])
  end

  def new
    @peca = Peca.new
  end

  def create
    @peca = Peca.new(params[:peca])
    @peca.criador = current_user.pessoa

    if @peca.save
      redirect_to :action => :index
    else
      render :action => :new
    end
  end

  def edit
    @peca = Peca.where("id = ?", params[:id]).first
  end

  def update
    @peca = Peca.where("id = ?", params[:id]).first

    if params[:peca][:visibilidade_ids].nil?
      @peca.visibilidades = []
    end

    if @peca.update_attributes(params[:peca])
      @peca.criador = current_user.pessoa

      if @peca.tipo_documento == 1
        @peca.arquivo = nil
      elsif @peca.tipo_documento == 2
        @peca.texto = nil
      end

      @peca.save

      redirect_to :action => :index
    else
      render :action => :edit
    end
  end

  def destroy
    @peca = Peca.where("id = ?", params[:id]).first
    @peca.destroy

    redirect_to :action => :index
  end

  def exibir_texto
    @peca = Peca.where("id = ?", params[:id]).first
  end

  private

  def carregar_loja
    @loja = Loja.where("id = ?", session[:loja_id]).first
  end

  def combos
    if current_user.has_role?(:admin_master)
      @graus = Grau.todos.collect { |grau| [grau.nome, grau.id] }
    else
      @graus = Grau.hierarquia(current_user).collect { |grau| [grau.nome, grau.id] }
    end

    # TODO => VERIFICAR Acho que inicialmente os da loja, e com alguma opção em que ele possa pesquisar os demais cadastrados.
    @autores = @loja.membros.collect { |membro| [membro.pessoa.nome, membro.pessoa.id] }
    @responsaveis = @loja.membros.collect { |membro| [membro.pessoa.nome, membro.pessoa.id] }

    @tipos_pecas = TipoPeca.todos.collect { |tipo| [tipo.nome, tipo.id] }
  end
end
