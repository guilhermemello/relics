class CreateEnderecos < ActiveRecord::Migration
  def change
    create_table :enderecos do |t|
      t.string :uf
      t.references :cidade
      t.string :nomeslog
      t.string :nomeclog
      t.references :bairro
      t.string :logradouro
      t.string :cep
      t.integer :uf_cod
      t.string :logracompl

      t.timestamps
    end
  end
end
