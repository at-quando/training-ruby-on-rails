Rails.application.routes.draw do

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/register' => 'users#new'
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'
  get ':token/confirm_email', :to => 'users#confirm_email', as: 'confirm_email'
  resources :users
  root 'users#index'
end
