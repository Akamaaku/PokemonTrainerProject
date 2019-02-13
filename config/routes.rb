Rails.application.routes.draw do
  get 'search/results'
  resources :trainers, only:[:index, :show]
  resources :teams, only:[:index, :show]
  resources :team_members, only:[:index, :show]
  resources :pokemons, only:[:index, :show]
  resources :generations, only:[:index, :show]
  resources :games, only:[:index, :show]
  resources :pages
  get 'static/:permalink', to: 'pages#permalink', as: 'static'
  root to: 'trainers#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
