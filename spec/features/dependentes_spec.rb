# -*- encoding : utf-8 -*-

require 'spec_helper'

describe "Loja" do
=begin
  context "Listagem" do
    before :each do
      logar(:usuario)
      carregar_dependencias
  	end

    it "Deve listar os dependentes do irmão" do
      visit "/dependentes"
      expect(page).to have_content("Carlos")
    end
  end

  def logar(rolename)
    role = FactoryGirl.create(rolename)
    mary = FactoryGirl.create(:suse, :roles => [role])

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
    FactoryGirl.create(:templo)
    FactoryGirl.create(:obediencia)
    FactoryGirl.create(:oriente_estadual)
    FactoryGirl.create(:rito)
  end
=end
end
