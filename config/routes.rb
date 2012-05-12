Cont24::Application.routes.draw do
  root :to => 'Pages#index'

  resources :anniversaries
  resources :users, :only => [:show]

  get "/auth/:provider/callback" => "sessions#callback"
  get "/logout" => "sessions#destroy", :as => :logout
end
