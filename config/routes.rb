Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'wake_up#index'

  get 'wake_up' => 'wake_up#index'
  post 'prospects' => 'prospects#create'


  resources :land_trusts
end
