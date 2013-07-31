class EventosController < ApplicationController
  layout "interno"

  before_filter :combos, :only => [:index, :new, :create, :edit, :update]
  before_filter :carregar_loja, :only => [:index, :new, :create, :edit, :update]

  def index
    @search = Evento.search(params[:search])
    @eventos = @search.where("loja_id = ?", @loja.id).paginate(:page => params[:page])
  end

  def new
    @evento = Evento.new
  end

  def create
    @evento = Evento.new(params[:evento])

    if @evento.save
      @loja.eventos << @evento

      redirect_to :action => :index
    else
      render :action => :new
    end
  end

  def edit
    @evento = Evento.where("id = ?", params[:id]).first
    @fotos = @evento.fotos
  end

  def update
    @evento = Evento.where("id = ?", params[:id]).first

    if params[:evento][:visibilidade_ids].nil?
      @evento.visibilidades = []
    end

    if @evento.update_attributes(params[:evento])
      redirect_to :action => :index
    else
      render :action => :edit
    end
  end

  def destroy
    @evento = Evento.where("id = ?", params[:id]).first
    @evento.destroy

    redirect_to :action => :index
  end

  def show
    @evento = Evento.where("id = ?", params[:id]).first
  end

  def adicionar_foto
    foto = Foto.create(params[:foto])
    redirect_to "/eventos/#{params[:foto][:evento_id]}/edit?#galeria"
  end

  def remover_foto
    foto = Foto.where("id = ? AND evento_id = ?", params[:id], params[:evento_id]).first
    foto.destroy if foto.present?
    redirect_to "/eventos/#{params[:evento_id]}/edit?#galeria"
  end

  private

  def carregar_loja
    @loja = Loja.where("id = ?", session[:loja_id]).first
  end

  def combos
    @tipo_eventos = TipoEvento.todos.collect { |te| [te.nome, te.id] }
    @visibilidade = []
  end
end
