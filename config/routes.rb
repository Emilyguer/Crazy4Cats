Rails.application.routes.draw do
  resources :posts
  devise_for :users

  # Establece la ruta raíz en "posts#index"
  root "posts#index"
end
