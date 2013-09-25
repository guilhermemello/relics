class RemoverCamposLojasUsers < ActiveRecord::Migration
  def change
    remove_column :lojas_users, :created_at
    remove_column :lojas_users, :updated_at
  end
end
