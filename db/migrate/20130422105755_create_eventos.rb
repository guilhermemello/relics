class CreateEventos < ActiveRecord::Migration
  def change
    create_table :eventos do |t|
      t.references :tipo_evento
      t.text :descricao
      t.date :data
      t.time :hora
      t.text :observacao
      t.integer :visibilidade
      t.references :loja

      t.timestamps
    end
  end
end
