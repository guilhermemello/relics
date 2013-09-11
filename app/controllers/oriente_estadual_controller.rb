class OrienteEstadualController < ApplicationController
  layout "interno"
  
  def index
   @search = Rito.search(params[:search])
   @ritos = @search
  end
  
end