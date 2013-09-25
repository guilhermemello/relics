# -*- encoding : utf-8 -*-

require 'spec_helper'

include Warden::Test::Helpers
Warden.test_mode!

describe "Oriente Estadual" do
  context "Listagem" do
    it "Exibe listagem de Orientes" do
      FactoryGirl.create(:oriente_estadual)
      login
      
      visit "/orientes_estaduais"
      expect(page).to have_content("Grande Oriente do Estado do Rio de Janeiro")
    end
  end
  
  context "Cadastro" do
    it "Cadastra um novo Oriente Estadual" do
    login
    
    visit "/orientes_estaduais"
    click_on "Novo Oriente"
    fill_in "oriente_estadual_nome", :with => "Grande Oriente do Estado de São Paulo"
    fill_in "oriente_estadual_sigla", :with => "GO-SP"
    fill_in "oriente_estadual_url", :with => "www.go-sp.com.br"
    fill_in "oriente_estadual_email", :with => "go-sp@gmail.com.br"
    click_on "Cadastrar"
    
    expect(page).to have_content("Grande Oriente do Estado de São Paulo")
    end
  end
  
  context "Edição" do
    it "Edita um Oriente Estadual já existente" do
      FactoryGirl.create(:oriente_estadual)
      login
      
      visit "/orientes_estaduais"
      click_on "Consultar"
      
      fill_in "oriente_estadual_nome", :with => "Grande Oriente do Estado de São Paulo"
      click_on "Atualizar"
      
      expect(page).to have_content("Grande Oriente do Estado de São Paulo")
    end   
  end
  
  context "Exclusão" do
    it "Exclui um oriente estadual" do
      FactoryGirl.create(:oriente_estadual)
      login
      
      visit "/orientes_estaduais"
      click_on "Excluir"
      page.driver.browser.switch_to.alert.accept
      
      expect(page).not_to have_content("Grande Oriente do Estado do Rio de Janeiro")
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