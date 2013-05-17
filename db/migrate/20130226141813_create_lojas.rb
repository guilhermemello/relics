class CreateLojas < ActiveRecord::Migration
  def change
    create_table :lojas do |t|
      t.string :nome
      t.string :numero
      t.date :fundacao
      t.integer :situacao
      t.string :circunscricao
      t.references :templo
      t.references :obediencia
      t.references :oriente_estadual
      t.references :rito
      t.text :curriculo

      t.timestamps
    end
  end
end
