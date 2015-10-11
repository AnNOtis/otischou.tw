Rails.application.routes.draw do
  namespace :backend do
    root 'articles#index'
    resources :articles do
      post :publish, on: :member
      post :unpublish, on: :member
    end
  end
end
