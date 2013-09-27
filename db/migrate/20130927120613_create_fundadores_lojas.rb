class CreateFundadoresLojas < ActiveRecord::Migration
  def change
    create_table :lojas_fundadores do |t|
      t.references :pessoa_id
      t.references :loja_id
    end
  end
end
