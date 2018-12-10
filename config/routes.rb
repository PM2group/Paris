Rails.application.routes.draw do

  resources :messages
  resources :super_users
  resources :reports
  #URLをcompanyから変更
  get 'search/member/:id', to: 'user_pages#index'
  post 'search/member/:id', to: 'company_offers#create'
  
  get 'search/member/message/new/:id', to: 'messages#new'
  post 'search/member/message/new/:id', to: 'messages#create'
  get 'search/company/message/new/:id', to: 'messages#new'
  post 'search/company/message/new/:id', to: 'messages#create'

  get 'search/company/:id', to: 'com_pages#index'
  
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

  post '/login_chat', to: 'sessions_chat#create'
  get '/login_chat', to: 'sessions_chat#create'
  
  delete '/user_pages', to: 'company_offer#destroy'

  get '/com_pages/:id', to: 'com_pages#index'
  get '/user_pages/:id', to: 'user_pages#index'
  post '/com_pages/:id', to: 'com_pages#index'
  post '/user_pages/:id', to: 'user_pages#index'
  
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
