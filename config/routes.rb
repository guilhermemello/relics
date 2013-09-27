Relics::Application.routes.draw do
  match 'combo/cidades/:estado_id' => 'combo#cidades_por_uf'
  match 'combo/cidades/com_loja/:estado_id' => 'combo#cidades_por_uf_com_loja'

  match 'combo/bairros/:cidade_id' => 'combo#bairros_por_cidade'
  match 'combo/bairros/com_loja/:cidade_id' => 'combo#bairros_por_cidade_com_loja'
  
  match 'loja/carregar_dados_templo/:templo_id' => 'lojas#carregar_dados_templo'
  match 'loja/carregar_dados_endereco/:loja_id' => 'lojas#carregar_dados_endereco'
  match 'loja/carregar/:loja_id' => 'irmaos#carregar_loja'
  match 'verificar_pessoa/:identificador/em/:loja_id' => 'irmaos#verificar_pessoa'
  match 'irmaos/:identificador/filiar/:loja_id' => 'irmaos#filiar_a_loja'
  match 'irmaos/:identificador/desfiliar/:loja_id' => 'irmaos#desfiliar_de_loja'
  match 'evento/adicionar_foto' => 'eventos#adicionar_foto'
  match 'evento/remover_foto/:id/:evento_id' => 'eventos#remover_foto'

  match 'selecionar_loja/:loja_id' => 'application#selecionar_loja'

  authenticated :user do
    root :to => 'dashboard#index'
  end

  devise_scope :user do
    root :to => "devise/sessions#new", :as => :new_user_session
  end

  as :user do
    get 'login' => 'devise/sessions#new', :as => :new_user_session
    get "cadastro" => "devise/registrations#new", :as => :new_user
    delete 'sair' => 'devise/sessions#destroy', :as => :destroy_user_session
  end
  
  devise_for :users

  resources :users
  resources :irmaos, :as => "pessoas"
  resources :pessoas
  resources :lojas
  resources :ritos
  resources :obediencias
  resources :orientes_estaduais
  resources :dashboard
  resources :permissoes
  resources :dependentes
  resources :eventos
  resources :pecas
  
  match 'pecas/:id/texto' => 'pecas#exibir_texto'

  resources :fundadores

  put 'update_password' => 'users#update_password'
end
