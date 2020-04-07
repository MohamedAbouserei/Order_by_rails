Rails.application.routes.draw do
  resources :fgroups
  resources :forders
  devise_for :models
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
