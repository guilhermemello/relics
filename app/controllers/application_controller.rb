class ApplicationController < ActionController::Base
  protect_from_forgery

  rescue_from CanCan::AccessDenied do |exception|
    #if exception.action == :edit || exception.action == :destroy
      #flash[:error] = "Permissão negada para editar ou excluir concursos ativos"
    #else
      #flash[:error] = exception.message
    #end
    redirect_to "/"
  end

  before_filter :carregar_lojas

  def selecionar_loja
    @loja = Loja.where("id = ?", params[:loja_id]).first
    session[:loja_id] = @loja.id

    redirect_to request.referer
  end

  def carregar_lojas
    if current_user
      if current_user.has_role?(:admin_master)
        @lojas_filiadas = Loja.todas
        @loja_default = @lojas_filiadas.first
        session[:loja_id] = @loja_default.id if session[:loja_id].nil?
      else
        irmao = Pessoa.where("user_id = ?", current_user.id).first
        @lojas_filiadas = irmao.filiacoes

        if @lojas_filiadas.size > 0
          @loja_default = @lojas_filiadas.first
          session[:loja_id] = @loja_default.id if session[:loja_id].nil?
        end
      end
    end
  end
end
