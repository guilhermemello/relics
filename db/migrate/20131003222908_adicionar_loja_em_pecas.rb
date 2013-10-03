class AdicionarLojaEmPecas < ActiveRecord::Migration
  def change
    add_column :pecas, :loja_id, :integer
  end
end
