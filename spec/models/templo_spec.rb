# -*- encoding : utf-8 -*-
require 'spec_helper'

describe "Templo" do
	before :each do
    FactoryGirl.create(:templo_equidade)
	end

  it "Deve listar todos os templos" do
  	expect(Templo.todos.size).to be > 0
  end
end
