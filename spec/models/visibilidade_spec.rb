# -*- encoding : utf-8 -*-

require 'spec_helper'

describe Visibilidade do
  before :each do
    FactoryGirl.create(:membros_da_loja)
    FactoryGirl.create(:macons)
    FactoryGirl.create(:dependentes)
    FactoryGirl.create(:publico)
	end

  it "Deve listar todos os tipos de peças" do
  	expect(Visibilidade.todas.size).to be == 4
  end
end
