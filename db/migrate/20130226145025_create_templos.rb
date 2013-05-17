class CreateTemplos < ActiveRecord::Migration
  def change
    create_table :templos do |t|
      t.string :nome
      t.string :endereco
      t.string :cep
      t.references :estado
      t.references :cidade
      t.references :bairro

      t.timestamps
    end
  end
end
