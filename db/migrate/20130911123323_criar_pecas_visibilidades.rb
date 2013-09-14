class CriarPecasVisibilidades < ActiveRecord::Migration
  def change
    create_table :pecas_visibilidades, :id => false do |t|
      t.references :peca
      t.integer :visibilidade_id
    end
  end
end
