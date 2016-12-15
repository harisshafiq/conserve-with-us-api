Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'wake_up' => 'wake_up#index'
  post 'prospects' => 'prospects#create'
end
