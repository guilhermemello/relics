# -*- encoding : utf-8 -*-

require 'spec_helper'

describe Profissao do
  before :each do
    FactoryGirl.create(:advogado)
    FactoryGirl.create(:alergista)
	end

  it "Deve listar todas as profissoes" do
  	expect(Profissao.todas.size).to be == 2
  end
end
