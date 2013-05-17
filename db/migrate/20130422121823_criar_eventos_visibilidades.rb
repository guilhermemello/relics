class CriarEventosVisibilidades < ActiveRecord::Migration
  def change
    create_table :eventos_visibilidades, :id => false do |t|
      t.references :evento
      t.integer :visibilidade_id
    end
  end
end
