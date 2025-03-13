Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
  namespace :api do
    namespace :v1 do
      resources :customers, only: [:index]
      resources :teas, only: [:index] 
      resources :subscriptions, only: [:index, :show] do
        resources :subscription_customers, only: [:index]  # Keep this line for the index route
        
        # Custom route for PATCH to update subscription_customer
        patch 'subscription_customers/:customer_id', to: 'subscription_customers#update', as: 'update_subscription_customer'
      end
    end
  end
end