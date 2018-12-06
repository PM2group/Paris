Rails.application.routes.draw do
  
  get 'search/member' => 'search#member'
  get 'search/company' => 'search#company'
  get 'search/chat' => 'search#chat'

  post 'search/member' => 'search#member'
  post 'search/company' => 'search#company'
  post 'search/chat' => 'search#chat'

  get '/login_com', to: 'sessions_com#new'
  post '/login_com', to: 'sessions_com#create'
  delete '/logout_com', to: 'sessions_com#destroy'
  
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  root to: 'tops#index'
  resources :users
  resources :user_pages
  resources :companys
  resources :com_pages
  resources :tops

end
