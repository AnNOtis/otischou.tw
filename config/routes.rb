Rails.application.routes.draw do
  namespace :backend do
    resources :articles, only: :index
  end
end
