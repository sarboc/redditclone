RedditClone::Application.routes.draw do

  root to: "posts#index"

  devise_for :users

  resources :posts do
    resources :comments
  end

  resources :comments

end
