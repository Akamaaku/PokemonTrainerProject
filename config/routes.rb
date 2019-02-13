Rails.application.routes.draw do
  get 'teams/index'
  get 'teams/show'
  resources :trainers, only:[:index, :show]
  resources :pages
  root to: 'trainers#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
