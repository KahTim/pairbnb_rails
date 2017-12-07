Rails.application.routes.draw do
  get 'reservations/:id/braintree/new' => 'braintree#new', as: :braintree_new
  post 'reservations/:id/braintree/checkout' => 'braintree#checkout', as: :braintree_checkout

  get 'home/index'

  resources :listings, only: [:index, :show]
  resources :passwords, controller: "clearance/passwords", only: [:create, :new]
  resource :session, controller: "clearance/sessions", only: [:create]
  resources :searches

  resources :users, controller: "users", only: [:create, :edit, :update] do
    resource :password,
      controller: "clearance/passwords",
      only: [:create, :edit, :update]
    resources :listings do
      resources :reservations
    end    
  end

  get "/sign_in" => "clearance/sessions#new", as: "sign_in"
  delete "/sign_out" => "clearance/sessions#destroy", as: "sign_out"
  get "/sign_up" => "clearance/users#new", as: "sign_up"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'home#index'

  get "/auth/:provider/callback" => "sessions#create_from_omniauth"
end
