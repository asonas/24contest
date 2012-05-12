Cont24::Application.routes.draw do
  resources :anniversaries
  root :to => 'Pages#index'

  get "/auth/:provider/callback" => "sessions#callback"
  get "/logout" => "sessions#destroy", :as => :logout
end
