class IrmaosController < ApplicationController
  layout "interno"

  before_filter :combos, :only => [:index, :new, :create, :edit, :update]
  before_filter :carregar_loja, :only => [:index, :new, :create, :edit, :update, :filiar_a_loja, :verificar_pessoa, :desfiliar_de_loja]

  def index
    if params[:situacao].present? and params[:situacao] == "2"
      params[:search][:filiado_em_is_not_null] = true
    elsif params[:situacao].present? and params[:situacao] == "3"
      params[:search][:desfiliado_em_is_not_null] = true
    end

    @search = Filiacao.search(params[:search])

    if params[:search].nil?
      @irmaos_filiados = @search.where("loja_id = ? AND filiado_em <> 'NULL'", session[:loja_id]).joins(:loja, :pessoa).paginate(:page => params[:page])
    else
      @irmaos_filiados = @search.where("loja_id = ?", session[:loja_id]).joins(:loja, :pessoa).paginate(:page => params[:page])
    end
  end

  def new
    @irmao = Pessoa.new
  end

  def create
    p params[:pessoa]
    @irmao = Pessoa.new(params[:pessoa])
    @irmao.categoria = Categoria::IRMAO

    if @irmao.save
      @irmao.filiar_a_loja(@loja)
      @irmao.criar_usuario

      redirect_to :action => :index
    else
      render :action => :new
    end
  end

  def edit
    @irmao = Pessoa.where("id = ?", params[:id]).first
    @dependentes = Pessoa.dependentes(@irmao)
  end

  def update
    @irmao = Pessoa.where("id = ?", params[:id]).first

    if @irmao.update_attributes(params[:pessoa])
      redirect_to :action => :index
    else
      render :action => :edit
    end
  end

  def filiar_a_loja
    if params[:opcao] == "cpf"
      @irmao = Pessoa.where("cpf = ?", params[:identificador]).first
    else
      @irmao = Pessoa.where("cim = ?", params[:identificador]).first      
    end

    @irmao.filiar_a_loja(@loja)

    redirect_to :action => :index
  end

  def desfiliar_de_loja
    if params[:opcao] == "cpf"
      @irmao = Pessoa.where("cpf = ?", params[:identificador]).first
    else
      @irmao = Pessoa.where("cim = ?", params[:identificador]).first      
    end

    @irmao.desfiliar_de_loja(@loja)

    redirect_to :action => :index
  end

  def verificar_pessoa
    if params[:opcao] == "cpf"
      pessoa = Pessoa.where("cpf = ?", params[:identificador]).first

      if pessoa.present? and pessoa.filiacoes.size > 0
        if pessoa.filiacoes.include?(@loja)
          render :json => { :ja_cadastrado_na_mesma_loja => true, :cpf => pessoa.cpf }
        else
          render :json => { :ja_cadastrado_em_outra_loja => true, :cpf => pessoa.cpf, :nome_irmao => pessoa.nome }
        end
      else
        render :nothing => true
      end
    else
      pessoa = Pessoa.where("cim = ?", params[:identificador]).first

      if pessoa.present? and pessoa.filiacoes.size > 0
        if pessoa.filiacoes.include?(@loja)
          render :json => { :ja_cadastrado_na_mesma_loja => true, :cim => pessoa.cim }
        else
          render :json => { :ja_cadastrado_em_outra_loja => true, :cim => pessoa.cim, :nome_irmao => pessoa.nome }
        end
      else
        render :nothing => true
      end
    end
  end

  private

  def carregar_loja
    @loja = Loja.where("id = ?", session[:loja_id]).first
  end

  def combos
    @grau = Grau.todos.collect { |grau| [grau.nome, grau.id] }
    @ufs = Estado.todos.collect { |r| [r.uf, r.id] }
    @paises = Pais.todos.collect { |r| [r.nome, r.id] }
    @profissoes = Profissao.todas.collect { |r| [r.nome, r.id] }
    @situacoes = Situacao::SITUACOES
  end
end