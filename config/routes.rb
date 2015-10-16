Rails.application.routes.draw do
  get 'pages/cv'

  root 'articles#index'

  resources :articles, only: [:index, :show]

  namespace :backend do
    root 'articles#index'
    resources :articles do
      post :publish, on: :member
      post :unpublish, on: :member
    end
  end
end
