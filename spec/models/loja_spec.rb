# -*- encoding : utf-8 -*-

require 'spec_helper'

describe Loja do
	before :each do
    @loja = FactoryGirl.create(:equidade)
    #p @loja.fundacao
	end

  it "Deve retornar a data de fundação com a máscara" do
    p @loja.fundacao
    expect(@loja.fundacao).to be_equal "01/01/2010"
  end
end
