# -*- encoding : utf-8 -*-

require 'spec_helper'
require 'cancan/matchers'

describe "Permissões" do
	
	context "Administrador do ambiente" do
		before :each do
      carrega_permissoes(:admin_ambiente)
		end

    it "Tem permissao para criar loja" do
    	expect(@ability).to be_able_to(:criar, Loja.new)
    end

    it "Tem permissao para excluir loja" do
    	expect(@ability).to be_able_to(:excluir, Loja.new)
    end
	end

	context "Administrador da loja" do
    it "Tem permissao para editar loja" do
      role = FactoryGirl.create(:admin_loja)
      mary = FactoryGirl.create(:mary, :roles => [role])
      @ability = Ability.new(mary)

      loja = FactoryGirl.create(:equidade, :users => [mary])
    	expect(@ability).to be_able_to(:editar, loja)
    end

    it "Não tem permissao para editar loja" do
      role = FactoryGirl.create(:admin_loja)
      mary = FactoryGirl.create(:mary, :roles => [role])
      @ability = Ability.new(mary)

      loja = FactoryGirl.create(:equidade)
    	expect(@ability).to_not be_able_to(:editar, loja)
    end
	end

	def carrega_permissoes(rolename)
		role = FactoryGirl.create(rolename)
    mary = FactoryGirl.create(:mary, :roles => [role])
    @ability = Ability.new(mary)
	end
end
