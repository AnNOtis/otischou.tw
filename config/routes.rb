Rails.application.routes.draw do
  root 'articles#index'
  
  resources :articles, only: [:index]

  namespace :backend do
    root 'articles#index'
    resources :articles do
      post :publish, on: :member
      post :unpublish, on: :member
    end
  end
end
