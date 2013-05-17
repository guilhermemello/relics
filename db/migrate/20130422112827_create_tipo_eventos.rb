class CreateTipoEventos < ActiveRecord::Migration
  def change
    create_table :tipo_eventos do |t|
      t.string :nome

      t.timestamps
    end
  end
end
