class CreateVisibilidades < ActiveRecord::Migration
  def change
    create_table :visibilidades do |t|
      t.string :nome

      t.timestamps
    end
  end
end
