RedditClone::Application.routes.draw do

  root to: "posts#index"

  devise_for :users

  resources :posts do
    resources :comments
  end

  resources :comments

  # get "login", as: "new_user_session_path"
  # get "logout", as: "destroy_user_session_path"

end
