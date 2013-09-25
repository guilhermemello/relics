class ObedienciasController < ApplicationController
  layout "interno"

  before_filter :combos, :only => [:index, :new, :create, :edit, :update]

  def index
    @search = Obediencia.search(params[:search])
    @obediencias = @search.order("nome ASC").paginate(:page => params[:page])
  end
  
  def new
    @obediencia = Obediencia.new
  end
  
  def create
    @obediencia = Obediencia.new(params[:obediencia])
    
    if @obediencia.save
      redirect_to :action => :index
    else
      render :action => :new
    end
  end
  
  def edit
    @obediencia = Obediencia.where("id = ?", params[:id]).first
  end
  
  def update
    @obediencia = Obediencia.where("id = ?", params[:id]).first
    
    if @obediencia.update_attributes(params[:obediencia])
      redirect_to :action => :index
    else
      render :action => :edit
      end 
  end

  def destroy
    @obediencia = Obediencia.where("id = ?", params[:id]).first
    @obediencia.destroy
    
    redirect_to :action => :index
  end

  def combos
    @ufs = Estado.todos.collect { |estado| [estado.uf, estado.id] }
  end
end