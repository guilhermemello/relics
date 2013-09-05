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
    fill_in "obediencia_email", :with => "obediencia@gmail.com"
    
    click_on "Cadastrar"
    expect(page).to have_content("Grande Oriente do Brasil")
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