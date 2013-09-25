class OrientesEstaduaisController < ApplicationController
  layout "interno"
  
  before_filter :combos, :only => [:index, :new, :create, :edit, :update]
  
  def index
   @search = OrienteEstadual.search(params[:search])
   @orientes_estaduais = @search.paginate(:page => params[:page])
  end
  
  def new
    @oriente_estadual = OrienteEstadual.new
  end
  
  def create
    @oriente_estadual = OrienteEstadual.new(params[:oriente_estadual])
    
    if @oriente_estadual.save
      redirect_to :action => :index
    else
      render :action => :new
    end
  end
  
  def edit
    @oriente_estadual = OrienteEstadual.where("id = ?", params[:id]).first
  end
  
  def update
    @oriente_estadual = OrienteEstadual.where("id = ?", params[:id]).first
    
    if @oriente_estadual.update_attributes(params[:oriente_estadual])
      redirect_to :action => :index
    else
      redirect_to :action => :edit
    end
  end
  
  def destroy
    @oriente_estadual = OrienteEstadual.where("id = ?", params[:id]).first
    @oriente_estadual.destroy
    
    redirect_to :action => :index
  end
  
  
  def combos
    @ufs = Estado.todos.collect { |estado| [estado.uf, estado.id] }
  end
end