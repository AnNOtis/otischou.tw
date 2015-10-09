Rails.application.routes.draw do
  namespace :backend do
    root 'articles#index'
    resources :articles, only: :index
  end
end
