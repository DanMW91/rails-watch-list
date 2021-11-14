Rails.application.routes.draw do

  get 'movies/search', 'movies#search'
  resources :movies, only: :create
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "lists#index"
  resources :lists, only: [:show, :new, :create] do
    resources :bookmarks, only: [:create]
    resources :reviews, only: [:create]
  end
  resources :bookmarks, only: [:destroy]

end
