class AdicionarDiaHoraEmLojas < ActiveRecord::Migration
  def up
    add_column :lojas, :dia, :string
    add_column :lojas, :hora, :string
  end
end
