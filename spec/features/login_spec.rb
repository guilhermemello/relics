# coding: utf-8

require 'spec_helper'

describe "Login" do
  it "Deve fazer o login com sucesso" do
    FactoryGirl.create(:mary)

    visit "/login"
    fill_in "user_email", :with => "mary@gmail.com"
    fill_in "user_password", :with => "123456"
    click_button "Entrar"
    expect(page).to have_content("Olá, Mary Doe")
  end

  it "Deve informar que o usuário efetuou um login incorreto" do
    FactoryGirl.create(:mary)

    visit "/login"
    fill_in "user_email", :with => "mary@gmail.com"
    fill_in "user_password", :with => "111111"
    click_button "Entrar"
    expect(page).to have_content("E-mail ou senha inválidos.")
  end

  it "Deve informar que o usuário ainda não confirmou a conta" do
    FactoryGirl.create(:mary_nao_confirmada)

    visit "/login"
    fill_in "user_email", :with => "mary@gmail.com"
    fill_in "user_password", :with => "123456"
    click_button "Entrar"
    expect(page).to have_content("Antes de continuar, confirme a sua conta.")
  end
end
