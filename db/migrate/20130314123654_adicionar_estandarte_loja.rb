class AdicionarEstandarteLoja < ActiveRecord::Migration
  def self.up
    add_attachment :lojas, :estandarte
  end

  def self.down
    remove_attachment :lojas, :estandarte
  end
end
