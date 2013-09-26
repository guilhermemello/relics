class AdicionarPessoaIdEmPecas < ActiveRecord::Migration
  def up
    add_column :pecas, :pessoa_id, :integer
  end

  def down
    remove_column :pecas, :pessoa_id
  end
end
