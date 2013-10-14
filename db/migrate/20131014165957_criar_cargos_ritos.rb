class CriarCargosRitos < ActiveRecord::Migration
  def change
    create_table :cargos_ritos, :id => false do |t|
      t.integer :rito_id
      t.integer :cargo_id
    end
  end
end
