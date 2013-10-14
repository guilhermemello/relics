class AdministracaoController < ApplicationController
  layout "interno"

  before_filter :carregar_loja, :only => [:index, :new, :create, :destroy]

  def index
    @search = Filiacao.search(params[:search])

    if params[:search].nil?
      @irmaos_filiados = @search.where("loja_id = ? AND filiado_em <> 'NULL'", session[:loja_id]).joins(:loja, :pessoa).paginate(:page => params[:page])
      p @irmaos_filiados
    else
      @irmaos_filiados = @search.where("loja_id = ?", session[:loja_id]).joins(:loja, :pessoa).paginate(:page => params[:page])
    end
  end

  def new
    @cargos = @loja.rito.cargos
  end

  def create
    # cria irmao
    if params[:nome].present? and params[:email].present?
     criar_irmao_usuario(params)
    end
  end

  def criar_irmao_usuario(params)
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

      redirect_to action: :index
    end
  end

  private

  def carregar_loja
    @loja = Loja.where("id = ?", session[:loja_id]).first
  end
end
