class ObedienciasController < ApplicationController
  layout "interno"
  
  def index
    @search = Obediencia.search(params[:search])
    @obediencias = Obediencia.todas
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
  
end