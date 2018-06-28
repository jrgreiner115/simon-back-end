Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :recordings, only: [:create, :show, :update, :delete]
      resources :users, only: [:create, :show, :update]
      resources :sessions, only: [:create]
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
