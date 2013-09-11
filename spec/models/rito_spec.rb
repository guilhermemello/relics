# -*- encoding : utf-8 -*-
require 'spec_helper'

describe "Rito" do
  before :each do
    FactoryGirl.create(:rito)
	end

  it "Deve listar todos os ritos" do
  	expect(Rito.todos.size).to be > 0
  end
end
