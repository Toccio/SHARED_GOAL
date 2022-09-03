Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :users, only: :show

  resources :lists do
    resources :classroom_categories, only: [:index] do
      resources :classrooms, only: [:show, :index, :new, :create] do
        resources :bookings, only: [:show, :index, :new, :create]
      end
    end
  end
  resources :classrooms, only: [ :edit, :update, :destroy ]
  resources :bookings, only: :destroy

  resources :chatrooms, only: [:new, :create, :show ] do
    resources :messages, only: :create
  end
end
