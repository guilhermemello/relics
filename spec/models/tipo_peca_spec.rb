# -*- encoding : utf-8 -*-

require 'spec_helper'

describe TipoPeca do
  before :each do
    FactoryGirl.create(:ritual)
    FactoryGirl.create(:simbolos)
    FactoryGirl.create(:personagens_historicos)
	end

  it "Deve listar todos os tipos de peças" do
  	expect(TipoPeca.todos.size).to be == 3
  end
end
