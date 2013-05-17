class CreateDependentes < ActiveRecord::Migration
  def change
    create_table :dependentes do |t|
      t.integer :pessoa_id
      t.integer :dependente_id
    end
  end
end
