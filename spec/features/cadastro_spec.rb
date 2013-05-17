# coding: utf-8

require 'spec_helper'

describe "Cadastro" do
  it "Deve realizar um cadastro válido" do
    visit "/cadastro"
    fill_in "user_email", :with => "jhon@gmail.com"
    fill_in "user_password", :with => "123456"
    fill_in "user_password_confirmation", :with => "123456"
    click_button "Criar"
    expect(page).to have_content("Entrar")
  end

  it "Deve exibir a validação ao não preencher os dados do cadastro" do
    visit "/cadastro"
    click_button "Criar"
    expect(page).to have_content("Email não pode ficar em branco")
    expect(page).to have_content("Password não pode ficar em branco")
  end
end
