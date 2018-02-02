Rails.application.routes.draw do
  resources :users
  root 'users#index'

  get 'user/change_password' => 'users#change_password', :as => 'change_user_password'
  put 'user/update_password' => 'users#update_password', :as => 'update_user_password'

  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'

  delete 'logout' => 'sessions#destroy'

  resources :groups
end
