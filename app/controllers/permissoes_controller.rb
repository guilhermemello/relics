class PermissoesController < ApplicationController
  layout "interno"

  before_filter :carregar_loja, :only => [:index, :show, :update]

  def index
    @search = Filiacao.search(params[:search])
    @irmaos_filiados = @search.where("loja_id = ?", @loja.id).filiados.joins(:loja, :pessoa).order("pessoas.nome ASC").paginate(:page => params[:page])
  end
 
  def show
    @irmao = Pessoa.where("id = ?", params[:id]).first
    @user = @irmao.user
  end

  def update
    @user = User.find(params[:id])

    if params[:user][:role_ids].to_i == Role::ADMIN_LOJA
      @user.lojas << @loja
    else
      @user.lojas.delete(@loja)
    end

    if @user.update_attributes(params[:user])
      redirect_to :action => :index
    end
  end

  private

  def carregar_loja
    @loja = Loja.where("id = ?", session[:loja_id]).first
  end
end
