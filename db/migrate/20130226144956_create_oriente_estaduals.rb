class CreateOrienteEstaduals < ActiveRecord::Migration
  def change
    create_table :oriente_estaduais do |t|
      t.references :obediencia
      t.string :nome
      t.string :sigla
      t.string :url
      t.string :email
      t.string :telefone
      t.string :graomestre
      t.string :secretario
      t.references :estado
      t.references :cidade
      t.references :bairro
      t.text :endereco
      t.string :cep

      t.timestamps
    end
  end
end
