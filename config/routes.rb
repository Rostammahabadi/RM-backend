Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      match '*all', controller: 'application', action: 'cors_preflight_check', via: [:options]
      post "/login", to: "login#create"
      get '/contractors', to: 'contractor#index'
      post '/contractors/new', to: 'contractor#create'
      get '/contractors/:id', to: 'contractor#show'
      patch '/contractors/:id', to: 'contractor#update'
    end
  end
end
