Rails.application.routes.draw do
  resources :fgroups
  resources :forders
  devise_for :models
  get '/auth/:provider/callback' => 'sessions#omniauth'
  get 'auth/failure', to: redirect('/')
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
