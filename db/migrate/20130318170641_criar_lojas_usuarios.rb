class CriarLojasUsuarios < ActiveRecord::Migration
  def change
    create_table :lojas_users, :id => false do |t|
      t.references :loja
      t.references :user

      t.timestamps
    end
  end
end
