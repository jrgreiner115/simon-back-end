Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :recordings, only: [:index, :create, :show, :update, :delete]
      resources :users, only: [:index, :create, :show, :update]
      resources :sessions, only: [:create]
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
