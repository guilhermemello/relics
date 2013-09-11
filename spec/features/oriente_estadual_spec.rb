# -*- encoding : utf-8 -*-

require 'spec_helper'

include Warden::Test::Helpers
Warden.test_mode!

describe "Oriente Estadual" do
  context "Listagem" do
    it "Exibe listagem de Orientes" do
      FactoryGirl.create(:oriente_estadual)
      
      visit "/orientes"
      expect(page).to have_content("Grande Oriente do Estado do Rio de Janeiro")
    end
  end

  def login
    templo = FactoryGirl.create(:templo_equidade)
    mary_loja = FactoryGirl.create(:equidade)
    mary_usuario = FactoryGirl.create(:mary)
    mary_pessoa = FactoryGirl.create(:mary_pessoa)
    mary_filiacao = FactoryGirl.create(:filiacao)
    FactoryGirl.create(:rj)
    FactoryGirl.create(:duque_de_caxias)
    FactoryGirl.create(:centro)

    login_as(mary_usuario, :scope => :user)
  end
end