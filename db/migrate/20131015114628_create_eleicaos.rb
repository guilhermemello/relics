class CreateEleicaos < ActiveRecord::Migration
  def change
    create_table :eleicoes do |t|
      t.belongs_to :pessoa
      t.belongs_to :cargo
      t.belongs_to :loja
      t.string :periodo

      t.timestamps
    end
  end
end
