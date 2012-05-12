Cont24::Application.routes.draw do
  resources :anniversaries
  resources :users, :only => [:show]
  root :to => 'Pages#index'

  get "/auth/:provider/callback" => "sessions#callback"
  get "/logout" => "sessions#destroy", :as => :logout
end
