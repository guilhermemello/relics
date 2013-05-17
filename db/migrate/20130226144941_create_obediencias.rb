class CreateObediencias < ActiveRecord::Migration
  def change
    create_table :obediencias do |t|
      t.string :nome
      t.string :sigla
      t.string :url
      t.string :email
      t.string :telefone
      t.string :graomestre
      t.string :secretario
      t.boolean :jurisdicao
      t.references :estado
      t.references :cidade
      t.references :bairro
      t.string :endereco
      t.string :cep
      t.references :loja

      t.timestamps
    end
  end
end
