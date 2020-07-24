Rails.application.routes.draw do
  get 'profile/edit'

  root 'static_pages#top'
  get '/signup', to: 'users#new'

  # ログイン機能
  get    '/login', to: 'sessions#new'
  post   '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  resources :users do
    member do
     get   '/profile/edit', to: 'profile#edit'
     patch '/profile/update', to: 'profile#update'
    end
  end
end