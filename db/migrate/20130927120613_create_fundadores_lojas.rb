class CreateFundadoresLojas < ActiveRecord::Migration
  def change
    create_table :fundadores_lojas do |t|
      t.integer :fundador_id
      t.references :loja
    end
  end
end
