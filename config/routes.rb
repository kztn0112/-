Rails.application.routes.draw do

  get 'notifications/index'
  get 'searches/search'
  root to: 'homes#top'
  resources :homes, only: [:index]

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:show, :edit, :update]

  resources :notifications, only: [:index]

  resources :questions do
    resources :answers, only: [:create, :destroy] do
       resources :likes, only: [:create, :destroy]
    end
    member do
      post :make_resolved
      delete :destroy_resolved
    end
    collection do
      get :unsolved
    end
  end

end
