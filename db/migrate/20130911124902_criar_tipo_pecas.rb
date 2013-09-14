class CriarTipoPecas < ActiveRecord::Migration
  def change
    create_table :tipo_pecas do |t|
      t.string :nome
    end
  end
end
