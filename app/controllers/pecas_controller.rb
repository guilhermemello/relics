class PecasController < ApplicationController
  layout "interno"

  before_filter :combos, :only => [:new, :index, :create]

  def index
    @search = Peca.search(params[:search])
    @pecas = @search.order("created_at DESC").paginate(:page => params[:page])
  end

  def new
    @peca = Peca.new
  end

  def create
    @peca = Peca.new(params[:peca])

    if @peca.save
      redirect_to :action => :index
    else
      render :action => :new
    end
  end

  private

  def combos
    @graus = Grau.todos.collect { |grau| [grau.nome, grau.id] }
    @irmaos = Pessoa.all.collect { |pessoa| [pessoa.nome, pessoa.id] }
    @tipos_pecas = TipoPeca.todos.collect { |tipo| [tipo.nome, tipo.id] }
  end
end
