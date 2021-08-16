Rails.application.routes.draw do

  get 'notifications/index'
  get 'searches/search'
  root to: 'homes#top'
  resources :homes, only: [:index]

  devise_for :users

  resources :users, only: [:show, :edit, :update]

  resources :notifications, only: [:index]

  resources :questions do
    resources :answers, only: [:create, :destroy] do
      resources :likes, only: [:create, :destroy]
    end
    member do
      post :create_resolved
      delete :destroy_resolved
    end
    collection do
      get :unsolved
    end
  end

end
