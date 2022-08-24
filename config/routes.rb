Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }

  root to: 'homes#top'
  get "homes/about" => "homes#about", as: "about"
  resources :spots, only: [:new, :index, :show, :edit, :create, :destroy, :update]
  get "search" => "searches#search"
  
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
