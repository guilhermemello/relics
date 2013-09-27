class CreateFundadoresLojas < ActiveRecord::Migration
  def change
    create_table :fundadores_loja do |t|
      t.references :pessoa
      t.references :loja
    end
  end
end
