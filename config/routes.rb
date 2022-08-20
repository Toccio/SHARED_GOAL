Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users, only: :show do
    resources :skills
  end

  resources :lists do
    resources :classrooms, only: [:show, :index, :new, :create ] do
      resources :bookings, only: [ :new, :create]
    end
  end

  resources :bookings, only: :destroy
end
