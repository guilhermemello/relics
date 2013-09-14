# coding: utf-8

require 'spec_helper'

describe "Usuário" do
  before(:each) do
    @attr = {
      :name => "Jhon Doe",
      :email => "jhon@gmail.com",
      :password => "123456",
      :password_confirmation => "123456"
    }
  end

  context "Validações" do
    it "Deve criar uma nova instância de um atributo válido" do
      User.create!(@attr)
    end

    it "Deve validar um email" do
      no_email_user = User.new(@attr.merge(:email => ""))
      no_email_user.should_not be_valid
    end

    it "Deve aceitar email válido" do
      addresses = %w[user@foo.com THE_USER@foo.bar.org first.last@foo.jp]
      addresses.each do |address|
        valid_email_user = User.new(@attr.merge(:email => address))
        valid_email_user.should be_valid
      end
    end

    it "Deve rejeitar email inválido" do
      addresses = %w[user@foo,com user_at_foo.org example.user@foo.]
      addresses.each do |address|
        invalid_email_user = User.new(@attr.merge(:email => address))
        invalid_email_user.should_not be_valid
      end
    end

    it "Deve rejeitar emails duplicados" do
      User.create!(@attr)
      user_with_duplicate_email = User.new(@attr)
      user_with_duplicate_email.should_not be_valid
    end

    it "Deve rejeitar email duplicado mesmo em caixa alta" do
      upcased_email = @attr[:email].upcase
      User.create!(@attr.merge(:email => upcased_email))
      user_with_duplicate_email = User.new(@attr)
      user_with_duplicate_email.should_not be_valid
    end
  end

  context "Senha" do
    before(:each) do
      @user = User.new(@attr)
    end

    it "Deve possuir um atributo senha" do
      @user.should respond_to(:password)
    end

    it "Deve possuir um atributo de confirmação de senha" do
      @user.should respond_to(:password_confirmation)
    end
  end

  context "Validação de senha" do
    it "Deve validar uma senha" do
      User.new(@attr.merge(:password => "", :password_confirmation => "")).
        should_not be_valid
    end

    it "Deve vakidar a confirmação de senha" do
      User.new(@attr.merge(:password_confirmation => "invalid")).
        should_not be_valid
    end

    it "Deve rejeitar senhas curtas" do
      short = "a" * 5
      hash = @attr.merge(:password => short, :password_confirmation => short)
      User.new(hash).should_not be_valid
    end
  end

  describe "Criptografia da senha" do
    before(:each) do
      @user = User.create!(@attr)
    end

    it "Deve possuir o atributo senha criptografada" do
      @user.should respond_to(:encrypted_password)
    end
  end
end