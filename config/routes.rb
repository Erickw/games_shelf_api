Rails.application.routes.draw do
  resources :users do
    resources :lists, only: [:index, :create]
    resources :evaluations, only: [:index, :create]
  end

  resources :lists, only: [:show, :update, :destroy]
  resources :evaluations, only: [:show, :update, :destroy]
end
