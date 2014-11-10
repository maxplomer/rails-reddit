Rails.application.routes.draw do
  resources :users, :only => [:create, :new, :show]
  resource :session, :only => [:create, :destroy, :new]

  root :to => "users#show"

  resources :subs, except: :destroy do
    resources :posts, except: :destroy
  end

  resources :comments, :only => [:create]

  resources :votes, :only => [:upvote, :downvote]

  post '/upvotes', to: 'votes#upvote', as: 'upvote'
  post '/downvotes', to: 'votes#downvote', as: 'downvote'
end