class AdicionarDadosMaconicos < ActiveRecord::Migration
  def change
    add_column :pessoas, :iniciacao_em, :date
    add_column :pessoas, :elevacao_em, :date
    add_column :pessoas, :exaltacao_em, :date
    add_column :pessoas, :instalacao_em, :date
  end
end
