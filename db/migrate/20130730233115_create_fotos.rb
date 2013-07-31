class CreateFotos < ActiveRecord::Migration
  def change
    create_table :fotos do |t|
      t.references :evento
      t.text :descricao
      t.attachment :imagem

      t.timestamps
    end
  end
end
