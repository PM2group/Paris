Rails.application.routes.draw do

  get 'search/company/:id', to: 'user_pages#index'
  post 'search/company/:id', to: 'company_offers#create'
  
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

  delete '/user_pages', to: 'company_offer#destroy'
  
  root to: 'tops#index'
  resources :users
  resources :user_pages, except: [:delete]
  resources :companys
  resources :com_pages
  resources :company_offers
  resources :chat_pages
  resources :chat_states
  resources :tops
end
