class CreateRitos < ActiveRecord::Migration
  def change
    create_table :ritos do |t|
      t.string :nome

      t.timestamps
    end
  end
end
