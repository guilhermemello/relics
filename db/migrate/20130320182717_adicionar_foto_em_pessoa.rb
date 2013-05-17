class AdicionarFotoEmPessoa < ActiveRecord::Migration
  def self.up
    add_attachment :pessoas, :foto
  end

  def self.down
    remove_attachment :pessoas, :foto
  end
end
