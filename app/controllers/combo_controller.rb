class ComboController < ApplicationController
  def cidades_por_uf
    @cidades = Cidade.select("DISTINCT cidades.id, cidades.nome").where("cidades.estado_id = ?", params[:estado_id]).order("cidades.nome ASC")
    render :json => @cidades.to_json
  end

  def cidades_por_uf_com_loja
    @cidades = Cidade.select("DISTINCT cidades.id, cidades.nome").joins("INNER JOIN lojas ON lojas.cidade_id = cidades.id").where("cidades.estado_id = ?", params[:estado_id])..order("cidades.nome ASC")
    render :json => @cidades.to_json
  end

  def bairros_por_cidade
    @bairros = Bairro.select("DISTINCT bairros.id, bairros.nome").where("bairros.cidade_id = ?", params[:cidade_id]).order("bairros.nome ASC")
    render :json => @bairros.to_json
  end

  def bairros_por_cidade_com_loja
    @bairros = Bairro.select("DISTINCT bairros.id, bairros.nome").joins("INNER JOIN lojas ON lojas.bairro_id = bairros.id").where("bairros.cidade_id = ?", params[:cidade_id]).order("bairros.nome ASC")
    render :json => @bairros.to_json
  end
end
