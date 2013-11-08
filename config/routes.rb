RedditClone::Application.routes.draw do

  root to: "posts#index"

  devise_for :users

  resources :posts, only: [:index, :new, :create] do
    resources :comments, only: [:create, :index]
  end

  resources :comments, only: [:create]

  resources :votes, only: [:index, :create]

  # get "login", as: "new_user_session_path"
  # get "logout", as: "destroy_user_session_path"

end
