class ComboController < ApplicationController
  def cidades_por_uf
    @cidades = Cidade.where("estado_id = ?", params[:estado_id]).all
    render :json => @cidades.to_json
  end

  def bairros_por_cidade
    @bairros = Bairro.where("cidade_id = ?", params[:cidade_id]).all
    render :json => @bairros.to_json
  end
end
