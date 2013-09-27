# -*- encoding : utf-8 -*-

require 'spec_helper'

describe "Peças de Arquitetura" do
  before :each do
    logar(:usuario)
    carregar_dependencias
	end

  context "Cadastro" do
    it "Deve cadastrar uma peça com texto livre" do
      visit "/pecas"
      click_link("Nova Peça")

      fill_in "peca_tema", :with => "Os Três Filósofos"
      select "Ritual", :from => "peca_tipo_peca_id"
      select "Aprendiz", :from => "peca_grau_id"
      select "Mary Doe", :from => "peca_autor_id"
      select "Mary Doe", :from => "peca_responsavel_id"
      check("checkbox-4")
      fill_in "peca_texto", :with => "conteúdo de uma peça de arquitetura"
      click_button "Cadastrar"
      expect(page).to have_content("Os Três Filósofos")
    end
  end

  context "Atualização" do
    it "deve atualizar uma peça" do
      FactoryGirl.create(:peca)

      visit "/pecas"
      click_link("Consultar")
      fill_in "peca_tema", :with => "Os Dois Filósofos"
      select "Símbolos", :from => "peca_tipo_peca_id"
      select "Companheiro", :from => "peca_grau_id"
      select "Mary Doe", :from => "peca_autor_id"
      select "Mary Doe", :from => "peca_responsavel_id"
      check("checkbox-3")
      fill_in "peca_texto", :with => "conteúdo de uma peça de arquitetura atualizado"
      click_button "Atualizar"
      expect(page).to have_content("Os Dois Filósofos")
    end
  end

  context "Exclusão" do
    it "deve excluir uma peça" do
      FactoryGirl.create(:peca)

      visit "/pecas"
      click_link("Excluir")
      page.driver.browser.switch_to.alert.accept
      expect(page).not_to have_content("Os Três Filósofos")
    end
  end

  def logar(rolename)
    role = FactoryGirl.create(rolename)
    suse = FactoryGirl.create(:suse, :roles => [role])
    suse_pessoa = FactoryGirl.create(:suse_pessoa)

    visit "/login"
    fill_in "user_email", :with => "suse@gmail.com"
    fill_in "user_password", :with => "123456"
    click_button "Entrar"
    expect(page).to have_content("Olá, Suse")
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

    FactoryGirl.create(:aprendiz)
    FactoryGirl.create(:companheiro)
    FactoryGirl.create(:mestre)
    FactoryGirl.create(:mestre_instalado)
    FactoryGirl.create(:ritual)
    FactoryGirl.create(:simbolos)
    FactoryGirl.create(:mary_pessoa)
    FactoryGirl.create(:membros_da_loja)
    FactoryGirl.create(:macons)
    FactoryGirl.create(:dependentes)
    FactoryGirl.create(:publico)
  end
end
