class AdicionarEnderecoLoja < ActiveRecord::Migration
  def change
    add_column :lojas, :endereco, :string
    add_column :lojas, :cep, :string
    add_column :lojas, :estado_id, :integer
    add_column :lojas, :cidade_id, :integer
    add_column :lojas, :bairro_id, :integer
  end
end
