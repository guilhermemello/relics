# -*- encoding : utf-8 -*-

require 'spec_helper'

include Warden::Test::Helpers
Warden.test_mode!

describe "Rito" do
  context "Cadastro" do
    it "Deve cadastrar um rito" do
      login

      visit "/ritos"
      click_on "Novo rito"
      fill_in "rito_nome", :with => "Brasileiro"
      click_button "Cadastrar"
      expect(page).to have_content("Brasileiro")
    end
  end

  context "Editar" do
    it "Deve editar um rito já existente" do
      login
      FactoryGirl.create(:schoder)

      visit "/ritos"
      click_on "Consultar"
      fill_in "rito_nome", :with => "Brasileiro"
      click_button "Atualizar"
      expect(page).to have_content("Brasileiro")
    end
  end
  
  context "Excluir" do
    it "Deve excluir um rito" do
      login
      FactoryGirl.create(:brasileiro)
      
      visit "/ritos"
      click_on "Excluir"
      page.driver.browser.switch_to.alert.accept
      
      expect(page).not_to have_content("Brasileiro")
    end
  end
  
  context "Listar" do
    it "Exibe a listagem de ritos" do
      login
      FactoryGirl.create(:brasileiro)
      FactoryGirl.create(:schoder)
      
      visit "/ritos"
      expect(page).to have_content("Brasileiro")
      expect(page).to have_content("Schoder")
    end
  end
  
  context "Filtro" do
    it "Filtra um rito pelo nome" do
      login
      FactoryGirl.create(:brasileiro)
      FactoryGirl.create(:schoder)
      
      visit "/ritos"
      fill_in "search_nome_contains", :with => "Brasileiro"
      click_on "Filtrar"
      expect(page).to have_content("Brasileiro")
      expect(page).not_to have_content("Schoder")
    end
    
    it "Limpa a filtragem" do
     login
      FactoryGirl.create(:brasileiro)
      FactoryGirl.create(:schoder)

      visit "/ritos"
      fill_in "search_nome_contains", :with => "Brasileiro"
      click_on "Filtrar"
      expect(page).to have_content("Brasileiro")
      expect(page).not_to have_content("Schoder")
      
      click_on "Limpar"
      expect(page).to have_content("Brasileiro")
      expect(page).to have_content("Schoder")
    end
  end

  def login
    templo = FactoryGirl.create(:templo_equidade)
    mary_loja = FactoryGirl.create(:equidade)
    mary_usuario = FactoryGirl.create(:mary)
    mary_pessoa = FactoryGirl.create(:mary_pessoa)
    mary_filiacao = FactoryGirl.create(:filiacao)

    login_as(mary_usuario, :scope => :user)
  end
end
