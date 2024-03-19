Rails.application.routes.draw do
  root 'authors#index'
  resources :authors do
    resources :books
  end
end
