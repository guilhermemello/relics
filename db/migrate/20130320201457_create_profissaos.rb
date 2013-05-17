class CreateProfissaos < ActiveRecord::Migration
  def change
    create_table :profissaos do |t|
      t.string :nome

      t.timestamps
    end
  end
end
