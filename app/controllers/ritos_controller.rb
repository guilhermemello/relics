class RitosController < ApplicationController
  layout "interno"
  
  def index
   @search = Rito.search(params[:search])
   @ritos = @search.paginate(:page => params[:page])
  end
  
  def new
    @rito = Rito.new
  end
  
  def create
    @rito = Rito.new(params[:rito])
    
    if @rito.save
      redirect_to :action => :index
    else
      render :action => :new
    end      
  end
  
  def edit
    @rito = Rito.where("id = ?", params[:id]).first
  end
  
  def update
    @rito = Rito.where("id = ?", params[:id]).first
    
    if @rito.update_attributes(params[:rito])
      redirect_to :action => :index
    else
      redirect_to :action => :edit
    end
  end
  
  def show
    @rito = Rito.where("id =?", params[:id]).first
  end
  
  def destroy
    @rito = Rito.where("id = ?", params[:id]).first
    @rito.destroy
    
    redirect_to :action => :index
  end
end
