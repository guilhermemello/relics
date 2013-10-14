class CriarCargos < ActiveRecord::Migration
  def change
    create_table :cargos do |t|
      t.string :nome
    end
  end
end
