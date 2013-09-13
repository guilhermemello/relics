require 'spec_helper'

describe Pais do
  before :each do
    FactoryGirl.create(:brasil)
	end

  it "Deve listar todos os paises" do
  	expect(Pais.todos.size).to be > 0
  end
end
