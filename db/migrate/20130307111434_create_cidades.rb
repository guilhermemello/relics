class CreateCidades < ActiveRecord::Migration
  def change
    create_table :cidades do |t|
      t.string :nome
      t.string :uf
      t.string :cep2
      t.string :cep
      t.references :estado

      t.timestamps
    end
  end
end
