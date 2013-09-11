class CreatePecas < ActiveRecord::Migration
  def change
    create_table :pecas do |t|
      t.text :tema, :limit => 100
      t.string :autor_nome
      t.references :tipo_peca # tipo de peça (ritual, símbolos, etc)

      t.references :grau

      t.integer :autor_id # autor
      t.integer :responsavel_id # responsável pela postagem

      t.integer :tipo_documento # tipo do documento (texto ou arquivo)
      t.text :texto # texto livre
      t.attachment :arquivo # arquivo upload

      t.timestamps
    end
  end
end
