Rails.application.routes.draw do
  resources :posts do
    get '/page/:page', action: :index, on: :collection
  end


  devise_for :users
  resources :comments, only: [:create]

  post '/new_user_reaction', to: 'reactions#new_user_reaction', as:
  'new_user_reaction'
  

  # Establece la ruta raíz en "posts#index"
  root "posts#index"
end
