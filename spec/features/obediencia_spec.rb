# -*- encoding : utf-8 -*-

require 'spec_helper'

include Warden::Test::Helpers
Warden.test_mode!

describe "Obediencia" do
  context "Listagem" do
    it "Exibe a listagem de obediências" do
      login
      FactoryGirl.create(:obediencia)
      
      visit "/obediencias"
      expect(page).to have_content("Grande Oriente do Brasil")    
    end
  end

  context "Cadastro" do
    it "Cadastra uma nova obediência" do
      login
  
      visit "/obediencias"
      click_on "Nova obediência"
      fill_in "obediencia_nome", :with => "Grande Oriente do Brasil"
      fill_in "obediencia_sigla", :with => "GOB"
      fill_in "obediencia_url", :with => "www.gob.com.br"
      fill_in "obediencia_email", :with => "obediencia@gmail.com"
      fill_in "obediencia_telefone", :with => "2222222222"
      fill_in "obediencia_graomestre", :with => "João Silva"
      fill_in "obediencia_secretario", :with => "Pedro Oliveira"
      select "RJ", :from => "estado_id"
      select "Duque de Caxias", :from => "cidade_id"
      select "Centro", :from => "bairro_id"
      fill_in "obediencia_endereco", :with => "Rua Alfredo Guimarães, 35"
      fill_in "obediencia_cep", :with => "55555555"
    
      click_on "Cadastrar"
      expect(page).to have_content("Grande Oriente do Brasil")
    end
  end
  
  context "Editar" do
    it "Edita uma obediência já existente" do
      FactoryGirl.create(:obediencia)
      login
      
      visit "/obediencias"
      click_on "Consultar"
      fill_in "obediencia_nome", :with => "Segundo Grande Oriente do Brasil"
      click_on "Atualizar"
      
      expect(page).to have_content("Segundo Grande Oriente do Brasil")
    end
  end
  
  context "Excluir" do
    it "Exclui uma obediência" do
      FactoryGirl.create(:obediencia)
      login
      
      visit "/obediencias"
      click_on "Excluir"
      page.driver.browser.switch_to.alert.accept
      
      expect(page).not_to have_content("Grande Oriente do Brasil")      
    end
  end
  
  context "Filtro" do
    it "Filtra uma obediência" do
      FactoryGirl.create(:obediencia)
      login
      
      visit "/obediencias"
      fill_in "search_nome_contains", :with => "Brasil"
      fill_in "search_sigla_contains", :with => "g"
      select "RJ", :from => "estado_id"
      select "Duque de Caxias", :from => "cidade_id"
      select "Centro", :from => "bairro_id"
      click_on "Filtrar"
      
      expect(page).to have_content("Grande Oriente do Brasil")
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