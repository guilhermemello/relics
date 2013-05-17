# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130424120552) do

  create_table "bairros", :force => true do |t|
    t.string   "uf"
    t.integer  "cidade_id"
    t.string   "nome"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "categoria", :force => true do |t|
    t.string   "nome"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "cidades", :force => true do |t|
    t.string   "nome"
    t.string   "uf"
    t.string   "cep2"
    t.string   "cep"
    t.integer  "estado_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "dependentes", :force => true do |t|
    t.integer "pessoa_id"
    t.integer "dependente_id"
  end

  create_table "enderecos", :force => true do |t|
    t.string  "uf",         :limit => 2,   :null => false
    t.integer "cidades_id",                :null => false
    t.string  "nomeslog",   :limit => 300, :null => false
    t.string  "nomeclog",   :limit => 300, :null => false
    t.integer "bairros_id",                :null => false
    t.string  "logradouro", :limit => 300, :null => false
    t.string  "cep",        :limit => 300, :null => false
    t.integer "uf_cod",                    :null => false
    t.string  "logracompl", :limit => 300, :null => false
  end

  add_index "enderecos", ["bairros_id"], :name => "fk_enderecos_bairros_idx"
  add_index "enderecos", ["cidades_id"], :name => "fk_enderecos_cidades_idx"

  create_table "estados", :force => true do |t|
    t.string   "nome"
    t.string   "uf"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "eventos", :force => true do |t|
    t.integer  "tipo_evento_id"
    t.text     "descricao"
    t.date     "data"
    t.time     "hora"
    t.text     "observacao"
    t.integer  "visibilidade"
    t.integer  "loja_id"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "eventos_visibilidades", :id => false, :force => true do |t|
    t.integer "evento_id"
    t.integer "visibilidade_id"
  end

  create_table "filiacoes", :force => true do |t|
    t.integer  "pessoa_id"
    t.integer  "loja_id"
    t.datetime "filiado_em"
    t.datetime "desfiliado_em"
  end

  create_table "graus", :force => true do |t|
    t.string   "nome"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "lojas", :force => true do |t|
    t.string   "nome"
    t.string   "numero"
    t.date     "fundacao"
    t.integer  "situacao"
    t.string   "circunscricao"
    t.integer  "templo_id"
    t.integer  "obediencia_id"
    t.integer  "oriente_estadual_id"
    t.integer  "rito_id"
    t.text     "curriculo"
    t.datetime "created_at",              :null => false
    t.datetime "updated_at",              :null => false
    t.string   "estandarte_file_name"
    t.string   "estandarte_content_type"
    t.integer  "estandarte_file_size"
    t.datetime "estandarte_updated_at"
    t.integer  "user_id"
    t.string   "dia"
    t.string   "hora"
    t.string   "endereco"
    t.string   "cep"
    t.integer  "estado_id"
    t.integer  "cidade_id"
    t.integer  "bairro_id"
  end

  create_table "lojas_users", :id => false, :force => true do |t|
    t.integer  "loja_id"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "obediencias", :force => true do |t|
    t.string   "nome"
    t.string   "sigla"
    t.string   "url"
    t.string   "email"
    t.string   "telefone"
    t.string   "graomestre"
    t.string   "secretario"
    t.boolean  "jurisdicao"
    t.integer  "estado_id"
    t.integer  "cidade_id"
    t.integer  "bairro_id"
    t.string   "endereco"
    t.string   "cep"
    t.integer  "loja_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "oriente_estaduais", :force => true do |t|
    t.integer  "obediencia_id"
    t.string   "nome"
    t.string   "sigla"
    t.string   "url"
    t.string   "email"
    t.string   "telefone"
    t.string   "graomestre"
    t.string   "secretario"
    t.integer  "estado_id"
    t.integer  "cidade_id"
    t.integer  "bairro_id"
    t.text     "endereco"
    t.string   "cep"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "pais", :force => true do |t|
    t.string   "nome"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "pessoas", :force => true do |t|
    t.string   "nome"
    t.string   "cpf"
    t.string   "cim"
    t.string   "telefone_residencial"
    t.string   "telefone_celular"
    t.string   "email_particular"
    t.string   "nome_pai"
    t.string   "nome_mae"
    t.date     "data_nascimento"
    t.integer  "estado_nascimento_id"
    t.integer  "pais_nascimento_id"
    t.string   "endereco"
    t.integer  "bairro_id"
    t.integer  "cidade_id"
    t.integer  "estado_id"
    t.string   "cep"
    t.boolean  "aposentado"
    t.string   "empresa"
    t.integer  "profissao_id"
    t.string   "telefone_comercial"
    t.string   "ramal"
    t.string   "email_comercial"
    t.integer  "categoria_id"
    t.integer  "user_id"
    t.integer  "grau_id"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
    t.string   "foto_file_name"
    t.string   "foto_content_type"
    t.integer  "foto_file_size"
    t.datetime "foto_updated_at"
  end

  create_table "profissaos", :force => true do |t|
    t.string   "nome"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "ritos", :force => true do |t|
    t.string   "nome"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "roles", :force => true do |t|
    t.string   "name"
    t.integer  "resource_id"
    t.string   "resource_type"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "roles", ["name", "resource_type", "resource_id"], :name => "index_roles_on_name_and_resource_type_and_resource_id"
  add_index "roles", ["name"], :name => "index_roles_on_name"

  create_table "templos", :force => true do |t|
    t.string   "nome"
    t.string   "endereco"
    t.string   "cep"
    t.integer  "estado_id"
    t.integer  "cidade_id"
    t.integer  "bairro_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "tipo_eventos", :force => true do |t|
    t.string   "nome"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "name"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "users_roles", :id => false, :force => true do |t|
    t.integer "user_id"
    t.integer "role_id"
  end

  add_index "users_roles", ["user_id", "role_id"], :name => "index_users_roles_on_user_id_and_role_id"

  create_table "visibilidades", :force => true do |t|
    t.string   "nome"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
