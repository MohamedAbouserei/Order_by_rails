Rails.application.routes.draw do
  get 'view/home'
  get '/watchNotification' ,to: 'notifcations#changestate'
  get '/updateseen' ,to: 'notifcations#updateseen'
  get '/search',to: 'friends#search_users'
  get '/addrequest',to: 'friends#new'
  get '/',to: 'home#index'
  get '/approvereq/:id', to: 'friends#approvereq'
  resources :friends
  post '/forders/add_friends' ,to: 'forders#add_friends',as: 'add_friends'

  resources :fgroups
  resources :forders
  devise_for :models
  get '/auth/:provider/callback' => 'sessions#omniauth'
  get 'auth/failure', to: redirect('/')


  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
