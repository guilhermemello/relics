# -*- encoding : utf-8 -*-

require 'spec_helper'

describe TipoEvento do
  before :each do
    FactoryGirl.create(:sessao)
    FactoryGirl.create(:evento_social)
    FactoryGirl.create(:eventos_maconicos)
	end

  it "Deve listar todos os tipos de eventos" do
  	expect(TipoEvento.todos.size).to be == 3
  end
end
