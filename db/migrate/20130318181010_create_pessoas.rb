class CreatePessoas < ActiveRecord::Migration
  def change
    create_table :pessoas do |t|
      t.string :nome
      t.string :cpf
      t.string :cim
      t.string :telefone_residencial
      t.string :telefone_celular
      t.string :email_particular
      t.string :nome_pai
      t.string :nome_mae
      t.date :data_nascimento
      t.integer :estado_nascimento_id
      t.integer :pais_nascimento_id
      t.string :endereco
      t.references :bairro
      t.references :cidade
      t.references :estado
      t.string :cep
      t.integer :aposentado
      t.string :empresa
      t.references :profissao
      t.string :telefone_comercial
      t.string :ramal
      t.string :email_comercial
      t.references :categoria
      t.references :user
      t.references :grau

      t.timestamps
    end
  end
end
