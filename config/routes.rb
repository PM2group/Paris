Rails.application.routes.draw do
  
<<<<<<< HEAD
  get 'search/member'
  get 'search/company'
  get 'search/chat'

  get 'search/company/:id', to: 'user_pages#index'
  post 'search/company/:id', to: 'company_offers#create'
  
=======
  get 'search/member' => 'search#member'
  get 'search/company' => 'search#company'
  get 'search/chat' => 'search#chat'

  post 'search/member' => 'search#member'
  post 'search/company' => 'search#company'
  post 'search/chat' => 'search#chat'

  get 'search/member/:id' => "member"

>>>>>>> doraemon/master
  get '/login_com', to: 'sessions_com#new'
  post '/login_com', to: 'sessions_com#create'
  delete '/logout_com', to: 'sessions_com#destroy'
  
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
<<<<<<< HEAD

  delete '/user_pages', to: 'company_offer#destroy'
  
  root to: 'tops#index'
  resources :users
  resources :user_pages, except: [:delete]
  resources :companys
  resources :com_pages
  resources :company_offers
=======
  root to: 'tops#index'
  resources :chat_pages
  resources :chat_states
  resources :users
  resources :user_pages
  resources :companys
  resources :com_pages
>>>>>>> doraemon/master
  resources :tops
end
