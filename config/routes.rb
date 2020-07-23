Rails.application.routes.draw do
  resources :validacions
  resources :descargas
  resources :admins
  get 'inbox/index'
  get 'home/index'
  resources :certificados
  resources :usuarios
  resources :groups
  get 'login/index'
  root 'login#user'

  resources :usuarios do
    collection { post :import }
  end

  get '/constancias' => 'login#validar', :as => 'constancias'
  get '/settings' => 'validacions#index', :as => 'settings'
  get '/inbox' => 'inbox#index', :as => 'index_inbox'
  get 'login/user' => 'login#user', :as => 'login_user'
  get 'login/admin' => 'login#admin', :as => 'login_admin'
  get 'home/out' => 'home#out', :as => 'login_out'
  get '/profile' => 'usuarios#editar', :as => 'profile'
  get '/error' => 'usuarios#error', :as => 'error'
  get 'home/out_admin' => 'home#out_admin', :as => 'login_out_admin'
  post 'login/validar' => 'login#validar', :as => 'login_validar'
  post 'login/validar_admin' => 'login#validar_admin', :as => 'login_validar_admin'

end
