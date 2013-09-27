class CriarFundadoresLojas < ActiveRecord::Migration
  def change
    create_table :fundadores_lojas do |t|
      t.references :pessoa
      t.references :loja
    end
  end
end
