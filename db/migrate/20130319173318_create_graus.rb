class CreateGraus < ActiveRecord::Migration
  def change
    create_table :graus do |t|
      t.string :nome

      t.timestamps
    end
  end
end
