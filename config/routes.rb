Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :users, only: :show

  resources :lists

  resources :instruments, only: [:show]

  resources :classroom_categories, only: [:show] do
    resources :classrooms, only: [:index, :new, :create] do
    end
  end

  resources :classrooms, only: [:edit, :update, :destroy, :show] do
    resources :bookings, only: [:index, :new, :create]
  end

  resources :bookings, only: [:destroy, :show]

  resources :chatrooms, only: [:new, :create, :show, :index] do
    resources :messages, only: :create
  end

  get 'booking/:id/accept', to: 'bookings#accept', as: :accept_booking
  get 'booking/:id/decline', to: 'bookings#decline', as: :decline_booking

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :classrooms, only: [:index, :show, :update, :create, :destroy]
    end
  end
end
