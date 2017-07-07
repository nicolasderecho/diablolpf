Rails.application.routes.draw do

  namespace :api do

    match "/heartbeat", to: "api#heartbeat", via: [:get, :post, :put, :patch]

    resources :runes, only: [:index]
    resources :runewords, only: [:index]
    resources :game_gems, only: [:index] do
      get :gem_types, on: :collection
    end
    resources :horadric_cube_formulas, only: [:index]
  end

  
  #match "/", to: "home#index", via: [:get, :post, :put, :patch]

  root to: "home#index"

  match "/*", to: "home#index", via: [:get, :post, :put, :patch]

end