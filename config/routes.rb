PostAppApi::Application.routes.draw do
  resource :session, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create]
  resources :comments, only: [:create, :show] do
    member do
      post 'downvote'
      post 'upvote'
    end
  end
  resources :subs, except: [:destroy]
  resources :posts do
    resources :comments, only: [:new]
    member do
      post 'downvote'
      post 'upvote'
    end
  end

  namespace :api, defaults: { format: :json } do
    resources :posts do
      resources :comments
    end
    match 'report/:city' => 'api#report', via: [:get, :post]
  end

  root to: redirect('/subs')
end
