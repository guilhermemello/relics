# -*- encoding : utf-8 -*-

require 'spec_helper'

describe "Loja" do
  context "Cadastro" do
    before :each do
      logar(:admin_ambiente)
      carregar_dependencias
  	end

    it "Deve cadastrar uma loja" do
      visit "/lojas/new"
      select("GOB", :from => "loja_obediencia_id")
      select("GO-RJ", :from => "loja_oriente_estadual_id")
      fill_in "loja_nome", :with => "Grande Loja Macônica do Estado do Rio de Janeiro"
      select("Schoder", :from => "loja_rito_id")
      select("JPLSJ EQUIDADE", :from => "loja_templo_id")
      click_button("Cadastrar")
    end

    it "Deve exibir as validações" do
      visit "/lojas/new"
      click_button("Cadastrar")
      expect(page).to have_content("informe uma obediência")
      expect(page).to have_content("informe um oriente estadual")
      expect(page).to have_content("informe um nome")
      expect(page).to have_content("informe um rito")
    end

    it "Não deve exibir o link para edição para administrador do ambiente" do
      FactoryGirl.create(:equidade)

      visit "/lojas"
      expect(page).to have_no_content("Editar")
    end
  end

  context "Edição" do
    before :each do
      carregar_dependencias
  	end

    it "Deve editar uma loja" do
      role = FactoryGirl.create(:admin_loja)
      mary = FactoryGirl.create(:mary, :roles => [role])
      mary_pessoa = FactoryGirl.create(:mary_pessoa)
      FactoryGirl.create(:equidade, :users => [mary])

      visit "/login"
      fill_in "user_email", :with => "mary@gmail.com"
      fill_in "user_password", :with => "123456"
      click_button "Entrar"
      expect(page).to have_content("Olá, Mary")

      visit "/lojas"
      click_link "Consultar"
      fill_in "loja_dia", :with => "Toda segunda-feira"
      click_button "Atualizar"
      expect(page).to have_content("Equidade")
    end
  end

  context "Exclusão" do
    before :each do
      logar(:admin_ambiente)
      carregar_dependencias
  	end

    it "Deve excluir uma loja" do
      FactoryGirl.create(:equidade)

      visit "/lojas"
      click_link "Excluir"
      page.driver.browser.switch_to.alert.accept
      expect(page).to have_content("Nenhum registro foi encontrado")
    end
  end

  def logar(rolename)
    role = FactoryGirl.create(rolename)
    mary = FactoryGirl.create(:mary, :roles => [role])
    mary_pessoa = FactoryGirl.create(:mary_pessoa)

    visit "/login"
    fill_in "user_email", :with => "mary@gmail.com"
    fill_in "user_password", :with => "123456"
    click_button "Entrar"
    expect(page).to have_content("Olá, Mary")
  end

  def carregar_dependencias
    FactoryGirl.create(:rj)
    FactoryGirl.create(:duque_de_caxias)
    FactoryGirl.create(:centro)
    FactoryGirl.create(:templo_equidade)
    FactoryGirl.create(:obediencia)
    FactoryGirl.create(:oriente_estadual)
    FactoryGirl.create(:schoder)
    FactoryGirl.create(:filiacao)
  end
end
