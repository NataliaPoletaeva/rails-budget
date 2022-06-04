Rails.application.routes.draw do
  devise_for :users
  resources :groups, only: [:index, :show, :new, :create, :destroy] do
    resources :entities, only: [ :new, :show, :create, :destroy]
  end

  post 'groups/:group_id', to: 'entities#create', as: 'transaction'
  get 'entities', to: 'entities#index', as: 'entities'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  # root "articles#index"
  devise_scope :user do 
    authenticated :user do 
      root 'groups#index', as: :authenticated_root 
    end
    unauthenticated do 
      root 'users#index', as: :unauthenticated_root 
    end 
  end
end
