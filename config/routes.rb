Rails.application.routes.draw do
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

  get 'inbox' => 'inbox#index', :as => 'index'
  get 'login/user' => 'login#user', :as => 'login_user'
  get 'login/admin' => 'login#admin', :as => 'login_admin'
  get 'home/out' => 'home#out', :as => 'login_out'
  get 'home/out_admin' => 'home#out_admin', :as => 'login_out_admin'
  post 'login/validar' => 'login#validar', :as => 'login_validar'
  post 'login/validar_admin' => 'login#validar_admin', :as => 'login_validar_admin'

  #import_usuarios post '/usuarios/import(.:format)' 'usuarios#import'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
