require 'spec_helper'

describe Grau do
  before :each do
    FactoryGirl.create(:aprendiz)
    FactoryGirl.create(:companheiro)
    FactoryGirl.create(:mestre)
    FactoryGirl.create(:mestre_instalado)

    @suse_usuario = FactoryGirl.create(:suse)
    @suse_pessoa = FactoryGirl.create(:suse_pessoa)
	end

  it "Deve listar todos os graus" do
  	expect(Grau.todos.size).to be == 4
  end

  it "Deve listar os graus com a hierarquia" do
    expect(Grau.hierarquia(@suse_usuario).size).to be == 2
  end
end
