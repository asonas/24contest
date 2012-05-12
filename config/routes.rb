Cont24::Application.routes.draw do
  root :to => 'Pages#index'
  get "/help" => "pages#help"

  resources :anniversaries
  resources :users, :only => [:show]

  get "/auth/:provider/callback" => "sessions#callback"
  get "/logout" => "sessions#destroy", :as => :logout
  get "/singularity" => "pages#singularity", :as => :singularity
  get "/singularity/execute" => "pages#execute", :as => :execute
end
