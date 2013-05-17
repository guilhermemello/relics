class CreateFiliacoes < ActiveRecord::Migration
  create_table :filiacoes do |t|
    t.references :pessoa
    t.references :loja
    t.datetime :filiado_em
    t.datetime :desfiliado_em
  end
end
