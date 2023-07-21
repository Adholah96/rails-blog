Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get '/posts/index', to: 'posts#index'
  get '/posts/show', to: 'posts#show'
  get '/user/index', to: 'users#index'
  get '/user/show', to: 'users#show'
  # Defines the root path route ("/")
  # root "articles#index"
  resources :users, only: %i[index show] do
    resources :posts, only: %i[index show]
  end
end
