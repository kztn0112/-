Rails.application.routes.draw do

  get 'searches/search'
  root to: 'homes#top'
  resources :homes, only: [:index]

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:show, :edit, :update]

  resources :questions do
    resources :answers, only: [:create, :destroy] do
       resources :likes, only: [:create, :destroy]
    end
  end

end
