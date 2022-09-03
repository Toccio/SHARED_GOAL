Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :users, only: :show

  resources :lists do
    resources :classroom_categories, only: [:index] do
      resources :classrooms, only: [:index, :new, :create] do
        resources :bookings, only: [:index, :new, :create]
      end
    end
  end
  resources :classroom_categories, only: [:show]
  resources :classrooms, only: [:edit, :update, :destroy, :show]
  resources :bookings, only: [:destroy, :show]

  resources :chatrooms, only: [:new, :create, :show] do
    resources :messages, only: :create
  end
end
