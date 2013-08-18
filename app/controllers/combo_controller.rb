class ComboController < ApplicationController
  def cidades_por_uf
    @cidades = Cidade.select("DISTINCT cidades.id, cidades.nome").joins("INNER JOIN lojas ON lojas.cidade_id = cidades.id").where("cidades.estado_id = ?", params[:estado_id]).all
    render :json => @cidades.to_json
  end

  def bairros_por_cidade
    @bairros = Bairro.select("DISTINCT bairros.id, bairros.nome").joins("INNER JOIN lojas ON lojas.bairro_id = bairros.id").where("bairros.cidade_id = ?", params[:cidade_id]).all
    render :json => @bairros.to_json
  end
end
