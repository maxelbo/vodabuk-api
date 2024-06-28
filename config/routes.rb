Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v0 do 
      namespace :volapuk do
        resources :words, only: [:index, :show, :create, :new, :update] do 
          collection do 
            get "by_root/:root", action: :by_root, as: :by_root
            get "by_letter/:letter", action: :by_letter, as: :by_letter
          end 
        end
      end
    end
  end

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
